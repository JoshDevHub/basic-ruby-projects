def bubble_sort(array)
  loop do
    current_array = array.clone
    array.each_with_index do |element, index|
      if index != (array.length - 1) && element > array[index + 1]
        temp = element
        array[index] = array[index + 1]
        array[index + 1] = temp
      else
        element
      end
    end
    current_array == array ? swap = false : swap = true
    if swap == false
      break
    end
  end
  array
end

p bubble_sort([4, 3, 78, 2, 0, 2])
