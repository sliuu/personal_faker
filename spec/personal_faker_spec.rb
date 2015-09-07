require 'spec_helper'

describe PersonalFaker do
  describe "different texts" do
    ['macbeth', 'drseuss', 'pride-and-prejudice'].each do |text|

      let(:faker) { PersonalFaker::Base.new(text) }

      it "should make sentences with #{text}" do
        expect(faker.sentence).to be_a_kind_of String
        expect(faker.question).to be_a_kind_of String
        puts faker.sentence
        puts faker.question
      end
    end
  end
end
