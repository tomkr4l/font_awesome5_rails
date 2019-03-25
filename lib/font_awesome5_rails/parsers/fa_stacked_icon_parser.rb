require_relative "parse_methods"

class FaStackedIconParser
  include ParseMethods

  attr_reader :reverse, :options, :span_classes, :first_icon_classes, :second_icon_classes, :text, :title

  def initialize(icon, options)
    @icon = icon
    @text = options[:text]
    @reverse = options[:reverse].nil? ? false : options[:reverse]
    @title = options[:title]
    @options = options
  end

  def span_classes
    @span_classes ||= parse_span_classes
  end

  def first_icon_classes
    @first_icon_classes ||= parse_icon_classes(@options[:base], true)
  end

  def second_icon_classes
    @second_icon_classes ||= parse_icon_classes(@icon, false)
  end

  private

  def parse_span_classes
    tmp = ["fa-stack"]
    tmp += @options[:class].split(" ") unless @options[:class].nil?
    tmp.uniq.join(" ").strip
  end

  def parse_icon_classes(klass, first)
    tmp = []
    tmp << icon_type(first && @options[:base_type].present? ? @options[:base_type] : @options[:type])
    tmp += arr_with_fa(klass)
    tmp << (first ? "fa-stack-2x" : "fa-stack-1x")
    tmp.uniq.join(" ").strip
  end

end