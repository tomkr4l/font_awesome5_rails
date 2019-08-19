require "font_awesome5_rails/parsers/fa_icon_parser"
require "font_awesome5_rails/parsers/fa_layered_icon_parser"
require "font_awesome5_rails/parsers/fa_stacked_icon_parser"

module FontAwesome5
  module Rails
    module IconHelper

      def fa5_icon(icon, options = {})
        parser = FaIconParser.new(icon, options)
        parser.get_content_tag
      end
      alias_method :fa_icon, :fa5_icon

      def fa5_stacked_icon(icon, options = {})
        parser = FaStackedIconParser.new(icon, options)

        tags = content_tag :span, class: parser.span_classes, title: parser.title do
          content_tag(:i, nil, class: (parser.reverse ? parser.second_icon_classes : parser.first_icon_classes) ) +
          content_tag(:i, nil, class: (parser.reverse ? parser.first_icon_classes : parser.second_icon_classes) )
        end
        tags += parser.text unless parser.text.nil?
        tags
      end
      alias_method :fa_stacked_icon, :fa5_stacked_icon

      def fa_layered_icon(options = {}, &block)
        parser = FaLayeredIconParser.new(options)
        if parser.size.nil?
          content_tag(:span, class: parser.classes, title: parser.title, style: parser.style, &block)
        else
          content_tag :div, class: "fa-#{parser.size}" do
            content_tag(:span, class: parser.classes, title: parser.title, style: parser.style, &block)
          end
        end
      end

      %w(fas far fal fab fad).each do |type|
        define_method :"#{type}_icon" do |icon, options = {}|
          options[:type] = type.to_sym unless options.key? :type
          fa_icon(icon, options)
        end

        define_method :"#{type}_stacked_icon" do |icon, options = {}|
          options[:type] = type.to_sym unless options.key? :type
          fa_stacked_icon(icon, options)
        end
      end

    end
  end
end
