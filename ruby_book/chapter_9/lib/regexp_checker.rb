print 'Text?: '
text = gets.chomp

begin
  print 'Pattern?: '
  pattern = gets.chomp
  regexp = Regexp.new(pattern)
  rescue RegexpError => exception
    puts "Invalid pattern: #{exception.message}"
    retry
end

matches = text.scan(regexp)
if matches.size > 0
  puts "Mathed: #{matches.join(',')}"
else
  puts 'Nothing matched.' 
end
