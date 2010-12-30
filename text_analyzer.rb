# analyzer.rb - Text Analyzer

stop_words = %w{the a by on for of are with just but and to the my I was some in}
lines = File.readlines("text.txt")
line_count = lines.size
text = lines.join

# Count the characters
character_count = text.length
character_count_nospaces = text.gsub(/\s+/,'').length

# Count the words, sentences, and paragraphs
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

# Make a list of words in the text that aren't stop words,
# count them, and work out the percentage of non-stop words
# against all words
all_words = text.scan(/w+/)
good_words = all_words.select{ |word| stop_words.include?(word)}
good_percentage = ((good_words.length.to_f/ all_words.length.to_f) * 100).to_i

# Summarize the text by cherry picking some choice sentences
sentences = text.gsub(/s+/,' ').strip.split(/\.|\?|\!/)
sentences_sorted = sentences.sort_by {|sentence| sentence.length}
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, on_third + 1)
ideal_sentences = ideal_sentences.select {|sentence| sentence =~ /is|are/}

# Give the analysis back to the user
puts "#{line_count} lines"
puts "#{character_count} characters"
puts "#{character_count_nospaces} characters (excluding spaces)"
puts "#{word_count} words"