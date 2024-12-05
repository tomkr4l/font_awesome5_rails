module FontAwesome5Rails
  module Parsers
    module ParseMethods
      def icon_type(type)
        return "fa-solid" if type.nil?

        case type.to_sym
        when :fas, :solid
          "fa-solid"
        when :far, :regular
          "fa-regular"
        when :fal, :light
          "fa-light"
        when :fat, :thin
          "fa-thin"
        when :fab, :brand
          "fa-brands"
        when :fad, :duotone
          "fa-duotone fa-solid"
        when :fadr, :duotone_regular
          "fa-duotone fa-regular"
        when :fadl, :duotone_light
          "fa-duotone fa-light"
        when :fadt, :duotone_thin
          "fa-duotone fa-thin"
        when :fash, :sharp
          "fa-sharp fa-solid"
        when :fashr, :sharp_regular
          "fa-sharp fa-regular"
        when :fashl, :sharp_light
          "fa-sharp fa-light"
        when :fashf, :sharp_thin
          "fa-sharp fa-thin"
        when :fadsh, :sharp_duotone
          "fa-sharp-duotone fa-solid"
        when :fadshr, :sharp_duotone_regular
          "fa-sharp-duotone fa-solid"
        when :fadshl, :sharp_duotone_light
          "fa-sharp-duotone fa-light"
        when :fadshf, :sharp_duotone_thin
          "fa-sharp-duotone fa-thin"
        when :fak, :uploaded
          "fa-kit"
        else
          "fa-solid"
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
