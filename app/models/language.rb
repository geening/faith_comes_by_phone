# == Schema Information
#
# Table name: languages
#
#  id                    :integer          not null, primary key
#  code                  :string(3)        not null
#  default_bible_version :string(255)
#  twilio_phone_number   :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#
# Indexes
#
#  index_languages_on_code                 (code) UNIQUE
#  index_languages_on_twilio_phone_number  (twilio_phone_number) UNIQUE
#

class Language < ActiveRecord::Base
  has_many :bible_books, :class_name => "Bible::Book"
  has_many :users
end
