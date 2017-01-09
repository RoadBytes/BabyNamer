# Join table to handle User favorites
class BabyNameUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorite, class_name: 'BabyName', foreign_key: 'baby_name_id'
end
