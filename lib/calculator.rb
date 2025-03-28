require 'pry'
class Calculator
  def add(numbers)
    return 0 if numbers.empty?
    numbers_array = handle_delimiter(numbers)
    numbers_array.sum
  end

  private

  def handle_delimiter(numbers)
    if numbers.start_with?('//')
      parts = numbers.split("\\n", 2)
      return 0 if parts.length < 2

      delimiter_match = parts[0].match(%r{//\[(.+?)\]})
      delimiter = Regexp.escape(delimiter_match[1]) if delimiter_match

      numbers = parts[1] || ""
      numbers.split(/#{delimiter}/).map(&:to_i)
    else
      numbers.split(/,|\n/).map(&:to_i)
    end
  end
  
end