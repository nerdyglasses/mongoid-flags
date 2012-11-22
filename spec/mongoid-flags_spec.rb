require 'helper'

class User
  include Mongoid::Document
  include Mongoid::Document::Flagable
  field :name
end

describe "A Flagable model" do
  let(:user) { User.new(name: 'John Doe') }

  it "should have an add_flag method" do
    user.should respond_to :add_flag
  end

  it "should have an add_flag! method" do
    user.should respond_to :add_flag!
  end

  it "should have a has_flag? method" do
    user.should respond_to :has_flag?
  end

  it "should have a remove_flag method" do
    user.should respond_to :remove_flag
  end

  it "should have a remove_flag! method" do
    user.should respond_to :remove_flag!
  end

  it "should be able to add a flag" do
    flag = "suspended"
    user.add_flag(flag)
    user.has_flag?(flag).should be true
  end

  it "should be able to remove a flag" do
    flag = "suspended"
    user.add_flag(flag)
    user.remove_flag(flag)
    user.has_flag?(flag).should_not be true
  end

  it "should be able to call add_flag multiple times" do
    user.add_flag('suspended')
    user.add_flag('to be removed')
    user.flags.count.should be 2
  end

  it "should only contain unique flags" do
    user.add_flag('suspended')
    user.add_flag('suspended')
    user.flags.count.should be 1
  end

  it "should be able to find flagged users with find_by_flags" do
    user.add_flag!('suspended')
    User.find_by_flags('suspended').first.should eq(user)
  end
end
