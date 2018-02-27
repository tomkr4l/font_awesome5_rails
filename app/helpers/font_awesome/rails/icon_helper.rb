require 'font_awesome5_rails/fa_icon_parser'

module FontAwesome
  module Rails
    module IconHelper

      def fa_icon(icon, options = {})
        parser = FaIconParser.new(icon, options)
        tags = []
        if parser.text.nil?
          tags << content_tag(:i, nil, class: parser.classes, style: parser.style, data: parser.data)
        else
          content_tag :span do
            tags << content_tag(:i, nil, class: parser.classes, style: parser.style, data: parser.data)
            tags << content_tag(:span, parser.text, style: "padding-left: 5px;#{parser.style}")
          end
        end
        tags.join.html_safe
      end

    end
  end
end