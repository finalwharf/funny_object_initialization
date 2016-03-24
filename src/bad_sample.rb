class BadSample
  def initialize(options)
    options.each do |key, value|
      self.class.class_eval do
        # This is unsafe, bad thinds are going to happen...
        attr_accessor key.to_sym
      end
      send("#{key}=", value) if value
    end
  end
end
