require 'test_helper'

class ContactControllerTest < ActionController::TestCase

  test "displayes the new contact us page correctly"  do  
    get :new 
    assert_response :success
    assert_template :new

   end

   test "sends a contact email and redirects to the home page and displays a notice to the user" do 
    message_attributes = attributes_for(:message)
    post :create, message: message_attributes
    # tying to the REST architecture, expecting us to post a message with the message parameters
    assert_equal ActionMailer::Base.deliveries.last.from.pop, 
    assert_response :redirect 
    assert_redirected_to root_path
    assert flash[:notice].present? #this makes sure that this is true
   end

   test "doesn\'t send a message and renders the new template for invalid messages" do
    post :create, message: attributes_for( :message, email: nil )
    #except we want this to fail, setting required attribute to something that we will make fail
    assert_response :success
    assert_template :new 
   end
end
