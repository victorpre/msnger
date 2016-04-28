class Contact < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  belongs_to :user, :class_name => 'User'

  scope :between, -> (owner_id,user_id) do
    where("(contacts.owner_id = ? AND contacts.user_id = ?) OR (contacts.user_id = ? AND contacts.owner_id = ?)", owner_id,user_id, owner_id, user_id).where.not(request: "pending")
  end
end
