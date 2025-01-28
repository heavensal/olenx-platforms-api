class Project < ApplicationRecord

  has_one_attached :avatar
  has_one_attached :qr_code

  belongs_to :portfolio
  belongs_to :user
end
