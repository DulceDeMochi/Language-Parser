# require dependencies
require 'rubygems'
require 'watir-webdriver'

## Collect foreign words from a file for later translation
#puts "Enter file path:"
#path = gets
#file = File.open("#{path.chomp}", "r")
file = File.open("samplesong.txt", "r")

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

# Open a browser to SpanishDict to look up definitions
browser = Watir::Browser.new :ff
url = "http://www.spanishdict.com/"

browser.goto url

#puts particles
#puts '*' * 20
#puts words
