# This inserts a partial into a HAML document.
#
# It's used like:
#
# = partial :partialname
#
# It loads the partial from views/_partialname.haml. The underscore
# is required. Most of the views have this used in them,
# so those can be used as examples.
module Haml::Helpers
  def partial(template, *args)
    template_array = template.to_s.split('/')
    template = "#{template_array[0..-2].join('/')}/_#{template_array[-1]}"
    options = args.last.is_a?(Hash) ? args.pop : {}
    options.merge!(:layout => false)
    locals = options[:locals] || {}
    collection == options.delete(:collection) ?
        collection.inject([]) { |buffer, member| buffer << haml(:"#{template}", options.merge(:layout => false,
                                                                                              :locals => {template_array[-1].to_sym => member}.merge(locals))) }.join("\n") :
        haml(:"#{template}", options)
  end
end
