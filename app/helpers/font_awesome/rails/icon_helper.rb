require "font_awesome5_rails/fa_icon_parser"

module FontAwesome
  module Rails
    module IconHelper

      def fa_icon(icon, options = {})
        parser = FaIconParser.new(icon, options)
        if parser.text.nil?
          content_tag(:i, nil, class: parser.classes, style: parser.style, data: parser.data)
        else
          content_tag :span do
            content_tag(:i, nil, class: parser.classes, style: parser.style, data: parser.data) +
            content_tag(:span, parser.text, class: "fa5-text #{parser.sizes}", style: parser.style)
          end
        end
      end

      def fa_stacked_icon(icon, options = {})
        #TODO
      end

    end
  end
end