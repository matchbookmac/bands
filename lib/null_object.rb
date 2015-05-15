class NullObject
  def method_missing(*args, &block)
    self
  end

  def titleize
    nil
  end

  def upcase
    nil
  end
end
