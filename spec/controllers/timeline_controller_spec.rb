require 'spec_helper'


describe TimelineController do
  render_views
  # describe "GET 'index'" do
  # it "returns http success" do
  # get 'index'
  # response.should be_success
  # end
  # end

  describe "with invalid user" do
    it "Only admin of group can edit timeline" do
      get 'index'
      response.body.should redirect_to ("/signin");
    end
  end

end
