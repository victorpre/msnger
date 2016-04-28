class AddSenderReceiverMessage < ActiveRecord::Migration
  def change
    rename_column :messages, :user_id, :sender_id
    add_column :messages, :recipient_id, :integer
    add_index :messages, :recipient_id
  end
end
