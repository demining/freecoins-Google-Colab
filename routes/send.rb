# encoding: UTF-8
# This is what happens when a user sends in a request for a payout.
#
# This is only done if the captcha was correct, the captcha checking
# is done before this ever happens.
post '/send' do
  address = params[:address]
  # We get the IP address to prevent using it more than once.
  # I know this isn't the best way, but it works well enough.
  ip = request.ip

  # We check if there are any transactions with the same bitcoin/IP
  # address as this one.
  same_address = Transaction.first(:address => address)
  same_ip = Transaction.first(:ip => ip)

  # This is used because even if there is a duplicate transaction
  # from the same IP/bitcoin address, we'll allow it to go through
  # if it's more than a week old.
  current_date = Time.now

  # Now we check if it's a bad transaction and return failure
  # if it is, along with an error type so that the page
  # can alert the user as to why their transaction was
  # invalid.
  if !same_address.nil?
    same_address_difference = Time.diff(same_address.timestamp, current_date)
    if same_address_difference[:week] < 1
      return {:success => false,
              :error => "bad_addr"}.to_json
    end
  elsif !same_ip.nil?
    same_ip_difference = Time.diff(same_ip.timestamp, current_date)
    if same_ip_difference[:week] < 1
      return {  :success => false,
        :error   => "bad_ip" }.to_json
    end
  end

  # If all is well, we create a transaction object in the database
  # for paying out later.
  transaction = Transaction.create(
    :ip => ip,
    :address => address,
    :timestamp => Time.now).o

    return { :success => true }.to_json
end
