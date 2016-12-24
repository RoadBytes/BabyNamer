# class to handle BabyName
class BabyName < ActiveRecord::Base
  validates :name, presence: true
end
