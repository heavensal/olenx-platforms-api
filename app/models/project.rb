class Project < ApplicationRecord

  has_one_attached :qr_code

  belongs_to :portfolio
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[title description]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end
end
