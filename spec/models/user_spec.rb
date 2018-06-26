require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before (:each) do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: "j@j", 
        password: "jennifer", 
        password_confirmation: "jennifer")
    end

    it "should save successfully when all required properties exist" do
      expect(@user).to be_present
    end

    it "insist on a valid first_name" do
      @user.first_name = nil
      expect(@user).not_to be_valid
    end

    it "insist on a valid last_name" do
      @user.last_name = nil
        expect(@user).not_to be_valid
    end

    it "insist on a valid email" do
      @user.email = nil
      expect(@user).not_to be_valid
    end
    
    it "insist on a valid password" do
      @user.password = nil 
      expect(@user).not_to be_valid
      expect(@user.password_digest).to be_nil
    end

    it "insist on a valid password_confirmation" do
      @user.password_confirmation = nil
      expect(@user).not_to be_valid
    end

    it "insist on unique email" do
      expect(@user).to be_valid

      @user1 = User.create(
        first_name: "dimitrios",
        last_name: "petropoulos",
        email: "J@J",
        password: "dimitrios",
        password_confirmation: "dimitrios"
        )
      expect(@user1).not_to be_valid
    end

    it "insist on password with minimum 3 characters" do
      @user.password = "je", 
      @user.password_confirmation = "je"
      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before (:each) do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: "j@j", 
        password: "jennifer", 
        password_confirmation: "jennifer")
    end

    it "should authenticate user if email matches password" do
      expect(User.authenticate_with_credentials("j@j", @user.password)).to be_truthy
    end
 
    it "should authenticate despite empty spaces in email" do
      expect(User.authenticate_with_credentials("  j@j  ", @user.password)).to be_truthy
    end

    it "should authenticate despite capitalized email" do
      expect(User.authenticate_with_credentials("J@J", @user.password)).to be_truthy
    end
  end
end
