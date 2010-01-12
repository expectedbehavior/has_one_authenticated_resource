module AuthenticatedResourceMethods

  class AuthenticatedResourceHelpers
    def self.headers_from_options(owner, options)
      return {} unless options && options[:headers]
      headers = options[:headers]
      headers.keys.each { |key| headers[key] = owner.send(headers[key]) }
      headers
    end
  end

  def has_one_authenticated_resource(resource_name, options = { })
    define_method(resource_name) do |*params|
      base = Object.const_get(resource_name.to_s.classify)
      r_class_name = "#{base.name}_#{self.id}"

      unless self.class.const_defined?(r_class_name)
        r_class = Class.new(base)
        self.class.const_set(r_class_name, r_class)
        
        r_class.cattr_accessor(:account)
        r_class.account = self
        r_class.element_name = base.element_name

        r_class.user     = self.send(options[:user])     if options[:user]
        r_class.password = self.send(options[:password]) if options[:password]
        r_class.site     = self.send(options[:site])     if options[:site]
        r_class.headers.merge!(AuthenticatedResourceHelpers.headers_from_options(self, options)) if options[:headers]
      end
      
      self.class.const_get(r_class_name)
    end
  end

end

ActiveRecord::Base.extend(AuthenticatedResourceMethods)
