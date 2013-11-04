require "test_helper"

class ContactMailerTest < ActionMailer::TestCase #test case already set up by rails, lets use what the smart guys gave us
  #spec syntax
  #let(:message) {build(:message)} #this is the same as the before do block in our other tests
  before do
    @message = build(:message)
     @email = ContactMailer.contact_us(@message).deliver 
  end
  #testing contact method first
  test "the contact us mailer is being delivered to the right email address" do 
    assert_equal @email.to.pop, "support@devpointlabs.com"
  end

  test "is delivered from the senders email" do 
    assert_equal @email.from.pop, @message.email
  end

  test "is delivered with an appropriate subject" do 
    assert_equal @email.subject, "[Portfolio Website] #{message.subject}"
  end
end

