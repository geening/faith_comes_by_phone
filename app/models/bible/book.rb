# == Schema Information
#
# Table name: bible_books
#
#  id            :integer          not null, primary key
#  position      :integer
#  name          :string(255)
#  chapter_count :integer
#  dam_id        :string(255)
#  external_id   :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_bible_books_on_external_id  (external_id) UNIQUE
#  index_bible_books_on_name         (name) UNIQUE
#

class Bible::Book < ActiveRecord::Base
end
