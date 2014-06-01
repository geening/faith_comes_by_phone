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

class Bible::Book < ActiveRecord::Base
  belongs_to :language
  
  scope :from_vauge_name, lambda { |vauge_name| where(["name=? OR external_id=?", vauge_name, vauge_name.gsub(/\s+/, '') ]) }
  
  def url(chapter=1)
    # Rails.cache.fetch("book-#{id}---chapter-#{chapter}") { DBP_CLIENT.url_for(external_id, chapter) }
    DBP_CLIENT.url_for(external_id, chapter)
  end
  
  def self.parse_str(str)
    clean = str.gsub(/\s+/, ' ').strip  # whitespace
    clean.gsub!(/:(\d+)$/, '')          # verse
    # clean.gsub!(/\s?(\d+)$/, " #{$&}")
    
    chapter = clean.match(/\d+$/).to_s
    book    = clean.match(/^(.*)\s\d+$/)[1].strip
    
    # Attempt to clean chapter
    chapter = begin
      _book = Bible::Book.from_vauge_name(book).first
      [chapter.to_i, _book.chapter_count].min.to_s
    rescue
      chapter
    end
    
    
    
    [book, chapter]
  end
end
