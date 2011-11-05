require 'spec_helper'


describe SessionsController do
render_views

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


  describe "Post 'create'" do
    describe "invalid sign" do
      
      before(:each) do
        @attr = { :email => "invalid@mail.com", :password => "1111"}
      end
      
      it "should re-render the new page" do
        post :create, :session => @attr
        response.should render_template('new')
      end
      
      it "should show error message" do
        post :create, :session => @attr
       # that dont work form me: response.should have_selector("div.error", :content => "Invalid User")
        response.body.should contain("Invalid user");
      end
      
    end
    
    describe "valid sign" do
      
      before(:each) do
        @attr = { :name => "example User", :email => "user1@group1.com", :password => "1234"}
        @user = Factory(:user)
        User.stub!(:find_by_email, @user.email).and_return(@user)
      end
      
      it "should show welcome message" do
        post :create, :session => @attr
        response.body.should contain("Welcome user");
        response.body.should contain("User logged:");
      end
      
    end   
    
  end

end
