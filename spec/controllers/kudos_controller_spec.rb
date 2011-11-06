require 'spec_helper'

describe KudosController do

  # describe "GET 'new'" do
    # it "returns http success" do
      # get 'new'
      # response.should be_success
    # end
  # end
# 
  # describe "GET 'create'" do
    # it "returns http success" do
      # get 'create'
      # response.should be_success
    # end
  # end

  describe "Segurity in kudos" do
    it "Only authenticated user of group can create kudos" do
      get 'new'
      response.body.should redirect_to ("/signin");
     end
  end

end
