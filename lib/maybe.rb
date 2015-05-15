  def Maybe(value)
    case value
    when nil then NullObject.new
    else value
    end
  end
