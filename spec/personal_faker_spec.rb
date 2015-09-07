require 'spec_helper'

describe PersonalFaker do
  describe "different texts" do
    ['macbeth', 'drseuss', 'pride-and-prejudice'].each do |text|

      let(:faker) { PersonalFaker::Base.new(text) }

      it "should make sentences with #{text}" do
        expect(faker.sentence).to be_a_kind_of String
        expect(faker.question).to be_a_kind_of String
      end

      it "should make words with #{text}" do
        expect(faker.word).to be_a_kind_of String
        expect(faker.words(4)).to be_a_kind_of String
      end

      it "should make phrases with the correct number of sentences" do
        expect(faker.text_phrase(10)).to be_a_kind_of String
        expect(faker.text_phrase(5).count(".")).to be(5)
      end
    end
  end
end
