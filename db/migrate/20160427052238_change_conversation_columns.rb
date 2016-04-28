class ChangeConversationColumns < ActiveRecord::Migration
   def up
    rename_column :conversations, :sender_id, :user1_id
    rename_column :conversations, :recipient_id, :user2_id
  end
 
  def down
    rename_column :conversations, :user1_id, :sender_id
    rename_column :conversations, :user2_id, :recipient_id
  end
end
