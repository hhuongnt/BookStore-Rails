class User < ApplicationRecord
  has_one :shopping_cart
  validates_presence_of :first_name, :last_name, :phone_number, :address
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
