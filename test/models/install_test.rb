require "test_helper"

describe Install do
  let(:install) { Install.new }

  it "must be valid" do
    install.must_be :valid?
  end
end
