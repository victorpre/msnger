class AddRequestToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :request, :string, :default => "pending"
  end
end
