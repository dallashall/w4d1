class CreateEmailForContacts < ActiveRecord::Migration
  def change
    change_table :contacts do |t|
      t.string :email, null: false
    end
  end
end
