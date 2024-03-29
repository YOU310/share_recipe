class User < ApplicationRecord
  has_many :comments, dependent: :nullify
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, confirmation: true

  with_options presence: true do
    validates :email
    validates :password_confirmation
  end

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.name = "guest"
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
