module FontAwesome
  module Rails
    module IconHelper

      def fa_icon(name, options = {})
        content_tag(:i, '', class: "fas fa-#{name}")
      end
    end
  end
end