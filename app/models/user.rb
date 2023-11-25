class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

validates :first_name, :last_name, presence: true, length: { maximum: 100, minimum: 3 }
validates :email, email: {mode: :strict}, length: { maximum: 150, minimum: 5 }
end
