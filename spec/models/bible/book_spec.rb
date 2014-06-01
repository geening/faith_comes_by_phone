# == Schema Information
#
# Table name: bible_books
#
#  id            :integer          not null, primary key
#  language_id   :integer          not null
#  position      :integer
#  name          :string(255)
#  chapter_count :integer
#  dam_id        :string(255)
#  external_id   :string(255)
#  version       :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_bible_books_on_external_id  (external_id) UNIQUE
#  index_bible_books_on_language_id  (language_id)
#  index_bible_books_on_name         (name) UNIQUE
#

require 'spec_helper'

describe Bible::Book do
  
  describe "#parse_str", :focus do
    it "returns a [book, chapter] array" do
      [ 
        # 'Gen11',
        'Gen 11',
        'Gen       11',
        'Gen 11:10',
      ].each {|str| subject.parse_str(str).should eql ['Gen', '11']}
    end
    
    it "does not let the chapter exceed the count" do
      create(:bible_book, external_id:'1Tim', chapter_count:6)
      
      subject.parse_str('1 Tim 100').should eql ['1 Tim', '6']
    end
  end
  
end
