class ContactsController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  layout false

  def search
    @search_string = params["search"]
    
    @contact_found = User.find_by(username: @search_string)
    if (@contact_found) # && !(contact_found.is_contact_of current_user)
      respond_to do |format|
        format.js {}
      end
    end
  end


  def add
    
    new_contact_user = User.find(params["add-id"].to_i)
    if(new_contact_user)
      contact = Contact.new({"owner_id" => current_user.id,"user_id" => new_contact_user.id})
      contact.save

      # Contact save but its pending
      render :nothing => true
    end
  end

  private

  def message_params
    params.require(:contact).permit(:search)
  end
end