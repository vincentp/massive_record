require 'spec_helper'
require 'orm/models/basic'

class TestClass < MassiveRecord::ORM::Base
end

describe MassiveRecord::ORM::Base do
  describe "#object" do
    it "should have a table name" do
      TestClass.table_name == "test_classes"
    end
    
    it "should have a model name" do
      TestClass.model_name == "TestClass"
    end
  end

  describe "#initialize" do
    it "should take a set of attributes and make them readable" do
      model = TestClass.new :foo => :bar
      model.foo.should == :bar
    end

    it "should initialize an object via init_with()" do
      model = TestClass.allocate
      model.init_with 'attributes' => {:foo => :bar}
      model.foo.should == :bar
    end
  end

  describe "equality" do
    it "should evaluate one object the same as equal" do
      person = Person.find(1)
      person.should == person
    end

    it "should evaluate two objects of same class and id as ==" do
      Person.find(1).should == Person.find(1)
    end

    it "should evaluate two objects of same class and id as eql?" do
      Person.find(1).eql?(Person.find(1)).should be_true
    end

    it "should not be equal if ids are different" do
      Person.find(1).should_not == Person.find(2)
    end

    it "should not be equal if class are different" do
      Basic.find(1).should_not == Person.find(2)
    end
  end
end