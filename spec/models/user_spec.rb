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

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
