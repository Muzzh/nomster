class Place < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :occurence, presence: true
  validates :address, presence: true
  validates :description, presence: true, length: { minimum: 20, maximum: 140 }  
end
