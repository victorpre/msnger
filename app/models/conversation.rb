class Conversation < ActiveRecord::Base
  belongs_to :user1, :foreign_key => :user1_id, class_name: 'User'
  belongs_to :user2, :foreign_key => :user2_id, class_name: 'User'

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :user1_id, :scope => :user2_id

  scope :involving, -> (user) do
    where("conversations.user1_id =? OR conversations.user2_id =?",user.id,user.id)
  end

  scope :between, -> (user1_id,user2_id) do
    where("(conversations.user1_id = ? AND conversations.user2_id =?) OR (conversations.user1_id = ? AND conversations.user2_id =?)", user1_id,user2_id, user2_id, user1_id)
  end

  

  def unread_msg_count (recipient_id)
    self.messages.where("read=? AND recipient_id=?",false, recipient_id).count
  end

  def unread_messages
    self.messages.where("read=?",false)
  end

  def read_messages!
    self.unread_messages.update_all(read: true)
  end
end
