numbers = [1, 2, 3, 4, 5, 6]
memo_collection = numbers.map { |number|  'memo_' + number.to_s}
memo_collection.each do |memo|
  p memo
end
