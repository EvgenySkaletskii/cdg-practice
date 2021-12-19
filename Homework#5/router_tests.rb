require "rspec"
require "./router.rb"

RSpec.describe "Test Posts controller" do
  subject { PostsController.new }

  before do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Post#1", "Post#2")
    subject.create
    subject.create
  end

  it "should show all posts" do
    expect { subject.index }.to output("Post#1\nPost#2\n").to_stdout
  end

  it "should show a post with valid id" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("1")
    expect { subject.show }.to output("Choose the post id\nPost#1\n").to_stdout
  end

  it "should show an error when showing a post with invalid id" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("3")
    expect { subject.show }.to output("Choose the post id\nIncorrect post id\n").to_stdout
  end

  it "should create a new post" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Post#3")
    expect(subject.create).to eq({ id: 3, content: "Post#3" })
    expect(subject.posts).to eq(["Post#1", "Post#2", "Post#3"])
  end

  it "should update an existed post" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("2", "Post#2 updated")
    expect { subject.update }.to output("Enter the post id\nEnter new content\nPost#2 updated\n").to_stdout
  end

  it "should show an error when updating a post with invalid id" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("3", "Post#3 updated")
    expect { subject.update }.to output("Enter the post id\nIncorrect post id\n").to_stdout
  end

  it "should delete an existed post" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("2")
    subject.destroy
    expect(subject.posts).to eq(["Post#1"])
  end

  it "should show an error when deleting a post with invalid id" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("3")
    expect { subject.destroy }.to output("Enter the post id\nIncorrect post id\n").to_stdout
    expect(subject.posts).to eq(["Post#1", "Post#2"])
  end
end

RSpec.describe "Test Comments controller" do
  subject { CommentsController.new }

  before do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Comment#1", "Comment#2")
    subject.create
    subject.create
  end

  it "should show all comments" do
    expect { subject.index }.to output("Comment#1\nComment#2\n").to_stdout
  end

  it "should show a comment with valid id" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("1")
    expect { subject.show }.to output("Choose the comment id\nComment#1\n").to_stdout
  end

  it "should show an error when showing a comment with invalid id" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("3")
    expect { subject.show }.to output("Choose the comment id\nIncorrect comment id\n").to_stdout
  end

  it "should create a new comment" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Comment#3")
    expect(subject.create).to eq({ id: 3, content: "Comment#3" })
    expect(subject.comments).to eq(["Comment#1", "Comment#2", "Comment#3"])
  end

  it "should update an existed comment" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("2", "Comment#2 updated")
    expect { subject.update }.to output("Enter the comment id\nEnter new content\nComment#2 updated\n").to_stdout
  end

  it "should show an error when updating a comment with invalid id" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("3", "Comment#3 updated")
    expect { subject.update }.to output("Enter the comment id\nIncorrect comment id\n").to_stdout
  end

  it "should delete an existed comment" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("2")
    subject.destroy
    expect(subject.comments).to eq(["Comment#1"])
  end

  it "should show an error when deleting a comment with invalid id" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("3")
    expect { subject.destroy }.to output("Enter the comment id\nIncorrect comment id\n").to_stdout
    expect(subject.comments).to eq(["Comment#1", "Comment#2"])
  end
end
