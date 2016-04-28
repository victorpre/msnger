class AddStatusToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :read, :boolean, :default => false
  end
end
