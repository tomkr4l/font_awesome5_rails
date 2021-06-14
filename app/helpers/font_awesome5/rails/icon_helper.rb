require 'font_awesome5_rails/parsers/fa_icon_parser'
require 'font_awesome5_rails/parsers/fa_layered_icon_parser'
require 'font_awesome5_rails/parsers/fa_stacked_icon_parser'

module FontAwesome5
  module Rails
    module IconHelper
      ICON_TYPES = %w(fas far fal fab fad fak).freeze

      def fa_inline_icon(icon, options = {})
        file = FontAwesome5Rails::Parsers::FaIconParser.new(icon, options).file
        return nil unless Pathname.new(file).exist?

        doc = Nokogiri::XML(File.read(file))
        svg = doc.root
        svg[:fill] = 'currentColor'
        classes = [options[:class], svg[:class]].flatten.compact.join ' '
        svg[:class] = classes if classes
        ActiveSupport::SafeBuffer.new(svg.to_s)
      end

      def fa5_icon(icon, options = {})
        FontAwesome5Rails::Parsers::FaIconParser.new(icon, options).tag
      end
      alias_method :fa_icon, :fa5_icon

      def fa5_stacked_icon(icon, options = {})
        parser = FontAwesome5Rails::Parsers::FaStackedIconParser.new(icon, options)

        tags = content_tag :span, class: parser.span_classes, title: parser.title do
          content_tag(:i, nil, class: (parser.reverse ? parser.second_icon_classes : parser.first_icon_classes), **parser.more_options(:base_options)) +
          content_tag(:i, nil, class: (parser.reverse ? parser.first_icon_classes : parser.second_icon_classes), **parser.more_options(:icon_options))
        end

        tags += parser.text unless parser.text.nil?
        tags
      end
      alias_method :fa_stacked_icon, :fa5_stacked_icon

      def fa_layered_icon(options = {}, &block)
        parser = FontAwesome5Rails::Parsers::FaLayeredIconParser.new(options)
        tag = content_tag(:span, class: parser.classes, title: parser.title, style: parser.style, &block)
        return tag if parser.size.nil?

        content_tag :div, class: "fa-#{parser.size}" do
          tag
        end
      end

      ICON_TYPES.each do |type|
        define_method :"#{type}_icon" do |icon, options = {}|
          options[:type] = type.to_sym unless options.key? :type
          fa_icon(icon, options)
        end

        define_method :"#{type}_inline_icon" do |icon, options = {}|
          options[:type] = type.to_sym unless options.key? :type
          fa_inline_icon(icon, options)
        end

        define_method :"#{type}_stacked_icon" do |icon, options = {}|
          options[:type] = type.to_sym unless options.key? :type
          fa_stacked_icon(icon, options)
        end
      end

    end
  end
end
