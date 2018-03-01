require "font_awesome5_rails/parsers/fa_icon_parser"
require "font_awesome5_rails/parsers/fa_layered_icon_parser"

module FontAwesome
  module Rails
    module IconHelper

      def fa_icon(icon, options = {})
        parser = FaIconParser.new(icon, options)
        if parser.text.nil?
          content_tag(:i, nil, class: parser.classes, style: parser.style, data: parser.data)
        else
          content_tag(:i, nil, class: parser.classes, style: parser.style, data: parser.data) +
          content_tag(:span, parser.text, class: "fa5-text #{parser.sizes}", style: parser.style)
        end
      end

      def fa_layered_icon(options = {}, &block)
        parser = FaLayeredIconParser.new(options)
        if parser.size.nil?
          content_tag(:span, class: parser.classes, style: parser.style, &block)
        else
          content_tag :div, class: "fa-#{parser.size}" do
            content_tag(:span, class: parser.classes, style: parser.style, &block)
          end
        end
      end

    end
  end
end