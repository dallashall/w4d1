class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :name, null: false
      t.integer :user_id, null: false
    end
  end
end
