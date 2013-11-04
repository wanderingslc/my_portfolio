class StaticPagesController < ApplicationController
  #this line will let you require a user to be logged before accessing the information in the array
  #before_filter :authenticate_user!, only: [:about]

  def home
    #@users = Users.includes(:pictures)
    #adding in whatever we want to come in as eager loading from the database. 
  end

  def projects
  end

  def about
  end

  def contact
  end
end
