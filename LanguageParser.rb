require 'rubygems'
require 'watir-webdriver'
require 'ap'

## Collect foreign words from a file for later translation
#puts "Enter file path:"
#path = gets
#file = File.open("#{path.chomp}", "r")
file = File.open("samplesong2.txt", "r")

# Manually pick out punctuation to avoid pulling international characters
words = []
particles = []

file.each_line do |row|
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

# Open a browser to SpanishDict to look up definitions
browser = Watir::Browser.new :ff
url = "http://www.spanishdict.com/"
browser.goto url

# Create a hash for defined words
defined_words = Hash.new

word_count = 0
until word_count == 10
  # Submit the word to the translation form
  browser.text_field(:id, "translation-textarea").set words[word_count]
  browser.form(:id, "translate-form").submit

  # Loop over spans and pull part of speech and first 2 possible definitions
  parts_of_speech = []
  definitions = []
  definition_count = 0
  part_of_speech_count = 0 

  browser.spans.each do |span|
    if span.class_name == "part_of_speech" && part_of_speech_count < 1
      parts_of_speech << span.text
      part_of_speech_count += 1
    elsif span.class_name == "def" && definition_count < 3
      definitions << span.text
      definition_count += 1
    end
  end

  defined_words[words[word_count]] = definitions
  word_count += 1
  sleep 15
end

ap defined_words

#puts particles
#puts '*' * 20
#puts words
