class Place < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :photos, dependent: :destroy
  
  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
  validates :occurence, presence: true
  validates :address, presence: true
  validates :description, presence: true, length: { minimum: 20, maximum: 140 }  
end
