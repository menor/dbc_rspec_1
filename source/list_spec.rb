require "rspec"

require_relative "list"

describe List do

  let(:title)       { "Be a billionaire playboy" }
  let(:list)        { List.new(title) }
  let(:tasks)       { ["Earn my first billion", "Get fit"] }
  let(:larger_list) { List.new(title, tasks) }

  describe "#initialize" do
    it "takes a title for its first argument" do
      list.should be_an_instance_of List
    end

    it "requires one argument" do
      expect { List.new }.to raise_error(ArgumentError)
    end

    it "can take an array as a second argument" do
      expect(larger_list).to be_an_instance_of List
    end

  end

  describe "#add_task" do
    it "should add a task to the list" do
      list.add_task("Laugh at poor people")
      expect(list.tasks.length).to be(1)
    end
  end

  describe "#complete_task" do
    it "should allow to complete tasks" do
      expect{ larger_list.complete_task(1) }.to be_true
    end

    it "should not allow to complete tasks out of index" do
      expect( larger_list.complete_task(100) ).to be_false
    end

  end

end