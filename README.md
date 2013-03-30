ANNOUNCEMENT
============

Unfortunately my computer has died and due to a lack of continous employment over the recent months I am currently unable to purchase a replacement machine at this point.

I will therefore no longer be developing this software until I am able to purchase a replacement.

It is always a little rude to ask for donations, but as I am developing this software free of charge for everyone to use. I will therefore be accepting donations towards the purchase of a new machine.

BTC: [1CdzakhzxS5QMfe9bM6KZapNWbFtfNKimx](bitcoin:1CdzakhzxS5QMfe9bM6KZapNWbFtfNKimx) | TRC: [1HgyXPsAhyD6wCGqp5Ntgq8549XkWTauvG](terracoin:1HgyXPsAhyD6wCGqp5Ntgq8549XkWTauvG) | LTC: [LRqjHkL5wFt9JxE5vmHGcxNCbqQMvyEJY5](litecoin:LRqjHkL5wFt9JxE5vmHGcxNCbqQMvyEJY5)

Okay, I'll also take [PayPal](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=G2M23XDAB8HBA)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Your Own Bitcoin Faucet
=======================

This is the code for the site [Legendary Faucet](http://legendaryfaucet.herokuapp.com), a
simple bitcoin faucet that pays out 0.00005BTC or more if I'm in a good mood.

If you want to use this as your own faucet, check out `config.example.json` for
some values you'll need to change. Be sure to change things like the footer file
(`views/_footer.haml`) and the ad files, either deleting them (and the
references to them) or changing them to reflect your own ads.

Attribution to this source would be greatly appreciated if you use this as your own faucet. It's a fork of the code from [mdszy](https://github.com/mdszy/freecoins) so all the real credit should go to them.

-----------------------------------------------------------------------------

How To Setup for Heroku
-----------------------

First sign up for [Heroku](http://www.heroku.com).
Download and install [Heroku Toolbelt](https://toolbelt.heroku.com/)
Launch Heroku toolbelt either in the directory you have your code in, or navigate to it.
Now let's run the commands:

`heroku login`
You will be asked for your email. Enter this.
You will then be asked for your password. Enter this.

Excellent. Now let's play a game of git.

`git init`
`git add .`
`git commit -m "foo"`

Now create your app
`heroku create`

Let's push!
`git push heroku master`

Assuming everything went fine, now you need your database

`heroku addons:add cleardb:ignite`

If you get a message about verifying your account go to [the verify page](http://www.heroku.com/verify) and enter credit card details. So long as you don't use paid services you will **NOT** be charged.

Now get your database location
`heroku config:get CLEARDB_DATABASE_URL`
You will see a bit long string that starts mysql: copy this

`heroku config:add DATABASE_URL=''`
Obviously set the contents of the string to what you got from above. **ALL OF IT!**

If you want automatic payouts, set up a cron job somewhere that runs
`curl -F secret=yoursecret http://yourapp.herokuapp.com/payout`
----------------------------------------
Donations
---------

The faucet is purely non-profit for me, it's about giving back to the community. So I won't accept personal donations for this project. However please feel free to send to [1GNCie7qmDKvPHhHmVmqpYHkY689Xx3wkU](bitcoin:1GNCie7qmDKvPHhHmVmqpYHkY689Xx3wkU) and they will be added to The Legendary Faucet!


[![Code Climate](https://codeclimate.com/github/PartTimeLegend/freecoins.png)](https://codeclimate.com/github/PartTimeLegend/freecoins) [![Build Status](https://travis-ci.org/PartTimeLegend/freecoins.png?branch=master)](https://travis-ci.org/PartTimeLegend/freecoins) [![Dependency Status](https://gemnasium.com/PartTimeLegend/freecoins.png)](https://gemnasium.com/PartTimeLegend/freecoins)