class AddBackgroundToBabyName < ActiveRecord::Migration
  def change
    add_column :baby_names, :background, :text
  end
end
