module FontAwesome5Rails
  module Parsers
    module ParseMethods
      def icon_type(type)
        return 'fas' if type.nil?

        case type.to_sym
        when :far, :regular
          'far'
        when :fal, :light
          'fal'
        when :fab, :brand
          'fab'
        when :fad, :duotone
          'fad'
        when :fak, :uploaded
          'fak'
        else
          'fas'
        end
      end

      def icon_type_path(type)
        return 'solid' if type.nil?

        case type.to_sym
        when :far, :regular
          'regular'
        when :fal, :light
          'light'
        when :fab, :brand
          'brands'
        when :fad, :duotone
          'duotone'
        else
          'solid'
        end
      end

      def prepend_fa(string)
        "fa-#{string}"
      end

      def arr_with_fa(array)
        array = handle_input(array)
        array.split(' ').map { |s| prepend_fa(s) }
      end

      private

      def handle_input(input)
        case input
        when Symbol
          input.to_s.dasherize
        when Array
          input.join(' ').dasherize
        else
          input.to_s
        end
      end
    end
  end
end
