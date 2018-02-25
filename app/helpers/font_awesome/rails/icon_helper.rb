module FontAwesome
  module Rails
    module IconHelper

      def fa_icon(icon, options = {})
        classes = ["fas"]
        classes << "fa-#{icon}"
        classes += options[:class].split(" ") if options[:class].present?
        classes << "fa-#{options[:size]}" if options[:size].present?
        classes << options[:animation].split(" ").map{|s| "fa-#{s}"} if options[:animation].present?
        classes = classes.uniq.join(" ")
        tags = []
        if options[:text].present?
          content_tag :span do
            tags << content_tag(:i, nil, class: classes, style: options[:style], data: options[:data])
            tags << content_tag(:span, options[:text], style: "padding-left: 5px;#{options[:style]}")
            tags.join.html_safe
          end
        else
          content_tag(:i, nil, class: classes, style: options[:style], data: options[:data])
        end
      end
    end
  end
end