# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  language_id     :integer          not null
#  phone_number    :string(20)       not null
#  bible_book_id   :integer
#  current_chapter :integer
#  last_call_at    :datetime
#  last_sms_at     :datetime
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_users_on_language_id   (language_id)
#  index_users_on_phone_number  (phone_number)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    phone_number "MyString"
    book_id 1
    chapter_id 1
    last_call_at "2014-05-31 16:37:12"
    last_sms_at "2014-05-31 16:37:12"
  end
end
