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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bible_book, :class => 'Bible::Book' do
    dam_id "MyString"
    external_id "MyString"
    name "MyString"
    position 1
    chapter_count 1
  end
end
