# require dependencies
require 'rubygems'
require 'watir-webdriver'

# Collect foreign words from a file for later translation
puts "Enter file path:"
path = gets
file = File.open("#{path.chomp}", "r")


# Manually pick out punctuation to avoid pulling international characters
words = []
particles = []

file.each_line do |row|
  row = row.gsub(/\.|\!|\@|\#|\$|\%|\^|\&|\*|\(|\)|\"|\?|\:|\,/, "").downcase.split(" ")
  words += row
end

words.uniq.each do |word|
  if word.length < 4
    particles << word
  end
end

words -= particles

