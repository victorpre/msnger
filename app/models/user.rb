class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
   has_many :conversations, :foreign_key => :sender_id
   has_many :contacts, :foreign_key => :owner_id

   # lets see
   validates :email, uniqueness: true
   validates :username, uniqueness: true

  def is_contact_of user
     (Contact.where(owner_id: self.id, user_id: user.id).size > 0 || Contact.where(owner_id:user.id , user_id: self.id).size > 0) || self.id == user.id
   end

  def contacts_ids
    ids = self.approved_contacts.pluck(:user_id)
    ids += self.approved_contacts.pluck(:owner_id)
    ids.delete(self.id)
    ids
  end

  def pending_contacts_ids
    ids = self.pending_contacts.pluck(:user_id)
    ids += self.pending_contacts.pluck(:owner_id)
    ids.delete(self.id)
    ids
  end

  def user_contact_list
    User.where(id: self.contacts_ids)
  end

  def contacts
   Contact.where('user_id=? OR owner_id=?',self.id,self.id)
  end

  def approved_contacts
    contacts.where.not(request: :pending)
  end

  def pending_contacts
   contacts.where(request: :pending)
  end

  def pending_contacts?
    (self.pending_contacts.length > 0)
   end

   def pending_contacts_count
     pending_contacts.length
   end

   def user_pending_contact_list
     User.where(id: self.pending_contacts_ids)
   end

   def conversations
     Conversation.where("user1_id =? OR user2_id=?",self.id,self.id)
   end
end
