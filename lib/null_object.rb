class NullObject
  def method_missing(*args, &block)
    self
  end

  def downcase
    nil
  end

  def titleize
    nil
  end
end
