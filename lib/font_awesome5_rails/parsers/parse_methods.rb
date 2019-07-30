module ParseMethods

  def icon_type(type)
    return "fas" if type.nil?
    case type.to_s
      when "far", "regular"
        "far"
      when "fal", "light"
        "fal"
      when "fab", "brand"
        "fab"
      when "fad", "duotone"
        "fad"      
      else
        "fas"
    end
  end

  def prepend_fa(string)
    "fa-#{string}"
  end

  def arr_with_fa(array)
    array = handle_input(array)
    array.split(" ").map{ |s| prepend_fa(s) }
  end

  private

  def handle_input(input)
    case input
    when Symbol
      input.to_s.gsub('_', '-')
    when Array
      input.collect{ |i| i.to_s.gsub('_', '-') }.join(' ')
    else
      input.to_s
    end
  end
end
