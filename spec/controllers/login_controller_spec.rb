require 'rails_helper'

RSpec.describe LoginController, type: :controller do
  class IdentityForTest
    def user_id
      "1234"
    end
    def name
      "Adam Green"
    end
    def email_address
      "ag1234@columbia.edu"
    end
  end
  before(:all) do
    (User.find_by_user_name "Adam Green").destroy
    if User.where(:user_name => "Adam Green").empty?
      User.create(:google_id => "1234", :user_name => "Adam Green",:email => "ag1234@columbia.edu")
    end
  end

  describe "create" do
    it "successfully logs the user in and sets the cookies" do
      user = User.find_by_user_name "Adam Green"
      expect_any_instance_of(LoginController).to receive(:authenticate_with_google).and_return(user)
      get :create
      expect(response).to redirect_to posts_path
      expect(cookies.signed[:user_id]).to eq(user.id)
    end

    it "fails to verify the user's account" do
      expect_any_instance_of(LoginController).to receive(:authenticate_with_google).and_return(nil)
      get :create
      expect(response).to redirect_to login_path
      expect(flash[:alert]).to match(/authentication_failed/)
    end
  end

  describe "authenticate_with_google" do
    it "authenticate an existing user with google" do
      (User.find_by_user_name "Adam Green").destroy
      User.create(:google_id => "1234", :user_name => "Adam Green",:email => "ag1234@columbia.edu")

      allow(GoogleSignIn::Identity).to receive(:new).with("1234").and_return(IdentityForTest.new)
      allow_any_instance_of(LoginController).to receive(:flash).and_return(google_sign_in: {"id_token" => "1234"})

      controller = LoginController.new
      user = controller.send(:authenticate_with_google)
      expect(user.id).to eq((User.find_by_user_name "Adam Green").id)
    end

    it "authenticate a new user with google" do
      (User.find_by_user_name "Adam Green").destroy

      allow(GoogleSignIn::Identity).to receive(:new).with("1234").and_return(IdentityForTest.new)
      allow_any_instance_of(LoginController).to receive(:flash).and_return(google_sign_in: {"id_token" => "1234"})
      controller = LoginController.new
      user = controller.send(:authenticate_with_google)
      expect(user.id).to eq((User.find_by_user_name "Adam Green").id)
    end

    it "fails to authenticate a user" do
      allow_any_instance_of(LoginController).to receive(:flash).and_return(google_sign_in: {"error" => "an error"})
      controller = LoginController.new
      user = controller.send(:authenticate_with_google)
      expect(user).to be_nil
    end
  end
end

