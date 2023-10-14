ret = catch(:break_loop) do
  3.times do |i|
    3.times do |j|
      puts "i, j = #{i}, #{j}"
      if i == 2 and j == 1
        throw :break_loop, 'ループ抜けたよ'
      end
    end
  end
end

puts ret
