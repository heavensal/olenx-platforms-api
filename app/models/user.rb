class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
          :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :ideas, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :qr_codes, dependent: :destroy
  has_one :portfolio, dependent: :destroy

  validates :email, presence: true, uniqueness: true



  after_create :create_portfolio

  def admin?
    role == "admin"
  end

end
