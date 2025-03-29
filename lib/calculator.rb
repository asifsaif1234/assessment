require 'pry'
class Calculator
  def add(numbers)
    return 0 if numbers.empty?
    numbers_array = handle_delimiter(numbers)
    handle_negative(numbers_array)
    numbers_array.sum
  end

  private

  def handle_delimiter(numbers)
    if numbers.start_with?('//')
      num_part = numbers.sub(/^\/\/.\\n/, '')
      delimiter = numbers[2]
      num_part.split(delimiter).map(&:to_i)
    else
      numbers.split(/,|\n/).map(&:to_i)
    end
  end

  def handle_negative(numbers)
    negatives = numbers.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(', ')}" unless negatives.empty?
  end
  
end