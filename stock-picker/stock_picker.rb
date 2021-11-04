def stock_picker(daily_prices)
  multi_array = daily_prices.map.with_index do |price, index|
    comparison_array = daily_prices[(index+1)..-1]
    comparison_array.map { |number| price - number}
  end
  best_value = multi_array.flatten.min
  found_value = multi_array.select { |array| array.include?(best_value) }.flatten
  found_first_day = multi_array.index(found_value)
  found_second_day = found_value.index(best_value)
  [found_first_day, (found_second_day + 2)]
end