require_relative 'parse_methods'

class FaIconParser
  include ParseMethods

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

  def sizes
    @sizes ||= @options[:size].nil? ? "" : arr_with_fa(@options[:size]).uniq.join(" ").strip
  end

  private

  def get_all_classes
    tmp = []
    tmp << icon_type(@options[:type])
    tmp << prepend_fa(@icon)
    tmp += @options[:class].split(" ") unless @options[:class].nil?
    tmp += arr_with_fa(@options[:size]) unless @options[:size].nil?
    tmp += arr_with_fa(@options[:animation]) unless @options[:animation].nil?
    tmp.uniq.join(" ").strip
  end
end