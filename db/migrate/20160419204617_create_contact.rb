class CreateContact < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :owner
      t.references :user
    end
  end
end
