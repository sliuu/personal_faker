require "personal_faker/version"

module PersonalFaker
  class Base
    attr_accessor :table
    attr_accessor :text
    attr_accessor :file

    def initialize(choose_text)
      if choose_text == 'dr-seuss'
        @file = 'lib/personal_faker/texts/dr-seuss.rtf'
      elsif choose_text == 'pride-and-prejudice'
        @file = 'lib/personal_faker/texts/pride-and-prejudice.rtf'
      elsif choose_text == 'macbeth'
        @file = 'lib/personal_faker/texts/macbeth.rtf'
      else
        raise StandardError, "No text with that name"
      end
    end

    def text
      return @text unless @text.nil?
      @text = File.open(@file, "r").read
      @text.gsub!("\n", ' ')
      @text.gsub!("\\", '')
      @text.gsub!('"', '')
      @text.gsub!('  ', ' ')
      @text.gsub!(/[_.,!?;:]/, '')
      @text.downcase!
      @text.gsub!(' i ', ' I ')
    end

    def table
      return @table unless @table.nil?
      position = 0
      position_of_second_word = text.index(' ', 1)
      table = {}
      until position_of_second_word.nil? || text.index(' ', position_of_second_word + 1).nil? do
        position_of_second_word += 1
        word = text[position..(position_of_second_word - 2)]
        second_word = text[position_of_second_word..(text.index(' ', position_of_second_word)-1)]
        table[word] ||= []
        table[word] << second_word
        position = position_of_second_word
        position_of_second_word = text.index(' ', position + 1)
      end
      @table = table
    end

    def sentence
      word = table.keys.sample.capitalize
      sentence = word
      10.times do
        if table[word]
          word = table[word].sample
        else
          word = table.keys.sample
        end
        sentence = sentence + " " + word
      end
      sentence = sentence + "."
    end

    def question
      word = table.keys.sample.capitalize
      sentence = word
      10.times do
        if table[word]
          word = table[word].sample
        else
          word = table.keys.sample
        end
        sentence = sentence + " " + word
      end
      sentence = sentence + "?"
    end

    def word
      word = table.keys.sample
    end

    def words(count)
      words = ""
      count.times do
        words << " " + word
      end
      words
    end

    def text_phrase(count)
      phrase = sentence
      (count - 1).times do
        phrase << " " + sentence
      end
      phrase
    end
  end
end
