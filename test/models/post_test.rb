require "test_helper"

describe Post do
  let(:post) { Post.new }

  it "must be valid" do
    post.must_be :valid?
  end
end
