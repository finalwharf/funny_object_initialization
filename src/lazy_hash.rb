class LazyHash < Hash
  def [](key)
    super(key) || super(key.to_s) || (key.respond_to?(:to_sym) ? super(key.to_sym) : nil)
  end

  def key?(key)
    super(key) || super(key.to_s) || (key.respond_to?(:to_sym) ? super(key.to_sym) : false)
  end
end
