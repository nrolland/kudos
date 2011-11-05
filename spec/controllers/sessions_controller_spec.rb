require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      response.should be_success
    end
    
    it "should be a login page" do
      get :new
      response.should have_selector("title", :content => "Sign in")
    end
    
  end

end
