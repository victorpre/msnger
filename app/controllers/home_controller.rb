class HomeController < ApplicationController
  def index
    # Todo filter by contact
    # @users = User.all.where("id != #{current_user.id} ")
    @users = current_user.user_contact_list
    
  end
end
