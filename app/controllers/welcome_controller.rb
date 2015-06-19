class WelcomeController < ApplicationController
  def index
  end

  def update_database
  	20.times { FactoryGirl.create :user } #creating 20 users
  	5.times { FactoryGirl.create :project } #creating 5 projects
  	redirect_to root_path
  end
  
end
