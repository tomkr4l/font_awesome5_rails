require_relative 'parse_methods'

module FontAwesome5Rails
  module Parsers
    class FaIconParser
      include ActionView::Helpers::TagHelper
      include ParseMethods

      GEM_PATH = Pathname.new('../../../../').expand_path(__FILE__)

      attr_reader :icon, :options, :data, :style, :text, :title, :right, :attrs

      def initialize(icon, options)
        @icon = icon
        @options = options
        @data = options[:data]
        @style = options[:style]
        @text = options[:text]
        @title = options[:title]
        @right = options[:right] == true
        @attrs = options.except(:text, :type, :class, :icon, :animation, :size, :right)
      end

      def classes
        @classes ||= parse_classes
      end

      def sizes
        @sizes ||= @options[:size].nil? ? '' : arr_with_fa(@options[:size]).uniq.join(' ').strip
      end

      def tag
        return icon_content_tag if @text.nil?

        @right ? (text_content_tag + icon_content_tag) : (icon_content_tag + text_content_tag)
      end

      def file
        file = GEM_PATH.join("app/assets/images/fa5/#{icon_type_path(@options[:type])}/#{@icon}.svg")
        file.exist? ? file : nil
      end

      private

      def parse_classes
        tmp = []
        tmp << icon_type(@options[:type])
        tmp += arr_with_fa(@icon)
        tmp += @options[:class].split(' ') unless @options[:class].nil?
        tmp += arr_with_fa(@options[:size]) unless @options[:size].nil?
        tmp += arr_with_fa(@options[:animation]) unless @options[:animation].nil?
        tmp.uniq.join(' ').strip
      end

      def icon_content_tag
        content_tag(:i, nil, class: classes, **@attrs)
      end

      def text_content_tag
        content_tag(:span, @text, class: "#{@right ? 'fa5-text-r' : 'fa5-text'}#{' ' unless sizes.blank?}#{sizes}",
                                  style: @style)
      end
    end
  end
end
