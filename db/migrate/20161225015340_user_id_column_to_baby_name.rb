class UserIdColumnToBabyName < ActiveRecord::Migration
  def change
    add_column :baby_names, :user_id, :integer
  end
end
