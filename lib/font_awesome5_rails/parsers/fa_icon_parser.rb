require_relative 'parse_methods'

class FaIconParser
  include ActionView::Helpers::TagHelper
  include ParseMethods

  attr_reader :icon, :options, :data, :style, :text, :title, :right, :attrs

  def initialize(icon, options)
    @icon = icon
    @options = options
    @data = options[:data]
    @style = options[:style]
    @text = options[:text]
    @title = options[:title]
    @right = options[:right] || false
    @attrs = options.except(:text, :type, :class, :icon, :animation, :size, :right)
  end

  def classes
    @classes ||= get_all_classes
  end

  def sizes
    @sizes ||= @options[:size].nil? ? "" : arr_with_fa(@options[:size]).uniq.join(" ").strip
  end

  def get_content_tag
    if @text.nil?
      icon_content_tag
    else
      @right ? (text_content_tag + icon_content_tag) : (icon_content_tag + text_content_tag)
    end
  end

  private

  def get_all_classes
    tmp = []
    tmp << icon_type(@options[:type])
    tmp += arr_with_fa(@icon)
    tmp += @options[:class].split(" ") unless @options[:class].nil?
    tmp += arr_with_fa(@options[:size]) unless @options[:size].nil?
    tmp += arr_with_fa(@options[:animation]) unless @options[:animation].nil?
    tmp.uniq.join(" ").strip
  end

  def icon_content_tag
    content_tag(:i, nil, class: classes, **@attrs)
  end

  def text_content_tag
    content_tag(:span, @text, class: "#{@right ? 'fa5-text-r' : 'fa5-text'}#{' ' unless sizes.blank?}#{sizes}", style: @style)
  end
end
