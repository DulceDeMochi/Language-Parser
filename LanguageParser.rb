
puts "Enter file path:"

path = gets

file = File.open("#{path.chomp}", "r")

words = []
particles = []

file.each_line do |row|
  # manually pick out punctuation to avoid pulling international characters
  row = row.gsub(/\.|\!|\@|\#|\$|\%|\^|\&|\*|\(|\)|\"|\?|\:|\,/, "").downcase.split(" ")
  words += row
end

words = words.uniq

words.each do |word|
  if word.length < 4
    particles << word
  end
end

words -= particles

# set language based on particles
puts words
puts '*' * 20
puts particles
