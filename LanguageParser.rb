file = File.open("samplesong.txt", "r")

words = []

file.each_line do |row|
  row = row.gsub(/\.|\!|\@|\#|\$|\%|\^|\&|\*|\(|\)|\"|\?|\:|\,/, "").downcase.split(" ")
  words += row
end
words = words.uniq

puts words
puts words.count