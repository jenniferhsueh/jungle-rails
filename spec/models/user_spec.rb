require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "should save successfully when all required properties exist" do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: "j@j", 
        password: "jennifer", 
        password_confirmation: "jennifer")
      expect(@user).to be_present
    end

    it "insist on a valid first_name" do
      @user = User.create(
        first_name: nil, 
        last_name: "hsueh", 
        email: "j@j", 
        password: "jennifer", 
        password_confirmation: "jennifer")
      expect(@user).not_to be_valid
    end

    it "insist on a valid last_name" do
      @user = User.create(
        first_name: "jenn", 
        last_name: nil, 
        email: "j@j", 
        password: "jennifer", 
        password_confirmation: "jennifer")
        expect(@user).not_to be_valid
    end

    it "insist on a valid email" do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: nil,
        password: "jennifer", 
        password_confirmation: "jennifer")
      expect(@user).not_to be_valid
    end
    
    it "insist on a valid password" do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: "j@j", 
        password: nil, 
        password_confirmation: "jennifer")
        # puts @user.inspect
      expect(@user).not_to be_valid
      expect(@user.password_digest).to be_nil
    end

    it "insist on a valid password_confirmation" do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: "j@j", 
        password: "jennifer", 
        password_confirmation: nil)
      expect(@user).not_to be_valid
    end

    it "insist on unique email" do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: "j@j", 
        password: "jennifer",
        password_confirmation: "jennifer")
      expect(@user).to be_valid

      @user1 = User.create(
        first_name: "dimitrios",
        last_name: "petropoulos",
        email: "J@J",
        password: "dimitrios",
        password_confirmation: "dimitrios")
      expect(@user1).not_to be_valid
    end

    it "insist on password with minimum 3 characters" do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: "j@j", 
        password: "je", 
        password_confirmation: "je")
      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should authenticate user if email matches password" do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: "j@j", 
        password: "jennifer", 
        password_confirmation: "jennifer")
      expect(User.authenticate_with_credentials("j@j", @user.password)).to be_truthy
    end
 
    it "should authenticate despite empty spaces in email" do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: "j@j", 
        password: "jennifer", 
        password_confirmation: "jennifer")
      expect(User.authenticate_with_credentials("  j@j  ", @user.password)).to be_truthy
    end

    it "should authenticate despite capitalized email" do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: "j@j", 
        password: "jennifer", 
        password_confirmation: "jennifer")
      expect(User.authenticate_with_credentials("J@J", @user.password)).to be_truthy
    end
  end
end
