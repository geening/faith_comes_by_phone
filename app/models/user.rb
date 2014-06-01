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

class User < ActiveRecord::Base
  belongs_to :current_book, :class_name => "Bible::Book", :foreign_key => "bible_book_id"
  belongs_to :language
  before_create :default_book
  
private
  def default_book
    self.current_book ||= Bible::Book.where(name:'John',language:language).first
    self.current_chapter ||= 1
  end
end
