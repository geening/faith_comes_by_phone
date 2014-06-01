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

require 'spec_helper'

describe Language do
  pending "add some examples to (or delete) #{__FILE__}"
end
