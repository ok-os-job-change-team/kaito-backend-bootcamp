def data_type_judgement(data)
  if data.is_a?(String)
    puts('String です。')
  elsif data.is_a?(Numeric)
    puts('Numeric です。')
  elsif data.is_a?(Array)
    puts('Array です。') 
  elsif data.is_a?(Hash)
    puts('Hash です。')
  else
    puts('判定できないデータです。')
  end
end

puts(data_type_judgement('123'))
puts(data_type_judgement(123))
puts(data_type_judgement([1, 2, 3]))
puts(data_type_judgement({"数字１" => 1, "数字2" => 2, "数字3" => 3}))

class User
end

user = User.new
puts(data_type_judgement(user))
