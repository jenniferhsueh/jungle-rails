require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "should save successfully when all required properties exist" do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: "j@j", 
        password: "j", 
        password_confirmation: "j")
      expect(@user).to be_present
    end

    it "insist on a valid first_name" do
      @user = User.create(
        first_name: nil, 
        last_name: "hsueh", 
        email: "j@j", 
        password: "j", 
        password_confirmation: "j")
      expect(@user).not_to be_valid
    end

    it "insist on a valid last_name" do
      @user = User.create(
        first_name: "jenn", 
        last_name: nil, 
        email: "j@j", 
        password: "j", 
        password_confirmation: "j")
        expect(@user).not_to be_valid
    end

    it "insist on a valid email" do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: nil,
        password: "j", 
        password_confirmation: "j")
      expect(@user).not_to be_valid
    end
    
    it "insist on a valid password" do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: "j@j", 
        password: nil, 
        password_confirmation: "j")
        puts @user.inspect
      expect(@user).not_to be_valid
      expect(@user.password_digest).to be_nil
    end

    it "insist on a valid password_confirmation" do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: "j@j", 
        password: "j", 
        password_confirmation: nil)
      expect(@user).not_to be_valid
    end

    it "insist on unique email" do
      @user = User.create(
        first_name: "jenn", 
        last_name: "hsueh", 
        email: "j@j", 
        password: "j",
        password_confirmation: "j")
      expect(@user).to be_valid

      @user1 = User.create(
        first_name: "d",
        last_name: "petro",
        email: "J@J",
        password: "k",
        password_confirmation: "k")
      expect(@user1).not_to be_valid
    end
  end
end
