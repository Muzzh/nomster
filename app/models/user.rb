class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  has_many :places
  has_many :comments

  validates :email, presence: true, uniqueness: true
  validates_format_of :email,:with => Devise::email_regexp 
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 15 }
  validates :password, length: { minimum: 8, maximum: 20 }, unless: "password.nil?"
  validates :password, presence: true, if: "id.nil?"

end
