require_relative "parse_methods"

class FaLayeredIconParser
  include ParseMethods

  attr_reader :aligned, :style, :size, :title


  def initialize(options)
    @aligned = options[:aligned].nil? ? true : options[:aligned]
    @style = options[:style]
    @size = options[:size]
    @title = options[:title]
    @options = options
  end

  def classes
    @classes ||= get_all_classes
  end

  private

  def get_all_classes
    tmp = ["fa-layers"]
    tmp << "fa-fw" if @aligned
    tmp += @options[:class].split(" ") unless @options[:class].nil?
    tmp.uniq.join(" ").strip
  end
end