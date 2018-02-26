module FontAwesome
  module Rails
    module IconHelper

      def fa_icon(icon, options = {})
        classes = ["fas"]
        classes << "fa-#{icon}"
        classes += options[:class].split(" ") unless options[:class].nil?
        classes += options[:size].split(" ").map{|s| "fa-#{s}"} unless options[:size].nil?
        classes += options[:animation].split(" ").map{|s| "fa-#{s}"} unless options[:animation].nil?
        classes = classes.uniq.join(" ")
        tags = []
        if options[:text].nil?
          content_tag(:i, nil, class: classes, style: options[:style], data: options[:data])
        else
          content_tag :span do
            tags << content_tag(:i, nil, class: classes, style: options[:style], data: options[:data])
            tags << content_tag(:span, options[:text], style: "padding-left: 5px;#{options[:style]}")
          end
          tags.join.html_safe
        end
      end
    end
  end
end