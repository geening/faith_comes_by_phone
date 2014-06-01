require 'spec_helper'

describe PhoneController do

  describe "GET 'call'" do
    it "returns http success" do
      get 'call'
      response.should be_success
    end
  end

  describe "GET 'sms'" do
    it "returns http success" do
      get 'sms'
      response.should be_success
    end
  end

end
