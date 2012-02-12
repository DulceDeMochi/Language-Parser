file = File.open("samplesong.txt", "r")

words = []
particles = []
verbs = []
adjectives = []
unknown = []

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

puts particles
#puts words
#puts words.count