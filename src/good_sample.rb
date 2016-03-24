require_relative 'lazy_hash'

class GoodSample
  attr_accessor :options

  def initialize(options)
    self.options = LazyHash.new
    self.options.merge!(options)
  end

  def method_missing(method_name)
    options.key?(method_name) ? options[method_name] : super
  end

  def respond_to?(method_name)
    options.key?(method_name) ? true : super
  end
end
