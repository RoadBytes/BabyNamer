class CreateBabyNameUser < ActiveRecord::Migration
  def change
    create_table :baby_name_users do |t|
      t.integer :user_id
      t.integer :baby_name_id

      t.timestamps null: false
    end
  end
end
