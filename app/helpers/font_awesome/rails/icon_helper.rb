module FontAwesome
  module Rails
    module IconHelper

      def fa_icon(icon, options = {})
        classes = ["fas"]
        classes << "fa-#{icon}"
        classes += options[:class].split(" ") if options[:class].present?
        classes << "fa-#{options[:size]}" if options[:size].present?
        classes << "fa-#{options[:animation]}" if options[:animation].present?
        classes << options[:animation].split(" ").map{|s| "fa-#{s}"} if options[:animation].present?
        styles = []
        icon = content_tag(:i, nil, class: classes.join(" "))
        if options[:text].present?
          # TODO
        end
      end
    end
  end
end