class FaIconParser
  attr_reader :icon, :options, :data, :style, :text

  def initialize(icon, options)
    @icon = icon
    @options = options
    @data = options[:data]
    @style = options[:style]
    @text = options[:text]
  end

  def classes
    @classes ||= get_all_classes
  end

  def icon_type(type)
    return "fas" if type.nil?
    case type.to_s
      when "far", "regular"
        "far"
      when "fal", "light"
        "fal"
      when "fab", "brand"
        "fab"
      else
        "fas"
    end
  end

  def prepend_fa(string)
    "fa-#{string}"
  end

  def arr_with_fa(array)
    array.split(" ").map{ |s| prepend_fa(s) }
  end

  private

  def get_all_classes
    tmp = []
    tmp << icon_type(@options[:type])
    tmp << prepend_fa(@icon)
    tmp += @options[:class].split(" ") unless @options[:class].nil?
    tmp += arr_with_fa(@options[:size]) unless @options[:size].nil?
    tmp += arr_with_fa(@options[:animation]) unless @options[:animation].nil?
    tmp.uniq.join(" ")
  end
end