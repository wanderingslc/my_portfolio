require "test_helper"

describe PicturesController do

  let(:picture) { pictures :one }

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pictures)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create picture" do
    assert_difference('Picture.count') do
      post :create, picture: {  }
    end

    assert_redirected_to picture_path(assigns(:picture))
  end

  it "must show picture" do
    get :show, id: picture
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: picture
    assert_response :success
  end

  it "must update picture" do
    put :update, id: picture, picture: {  }
    assert_redirected_to picture_path(assigns(:picture))
  end

  it "must destroy picture" do
    assert_difference('Picture.count', -1) do
      delete :destroy, id: picture
    end

    assert_redirected_to pictures_path
  end

end
