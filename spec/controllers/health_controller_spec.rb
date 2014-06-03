require 'spec_helper'

describe HealthController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
      response.body.should eql 'ok'
    end
  end

end
