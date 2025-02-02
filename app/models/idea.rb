class Idea < ApplicationRecord
  has_one_attached :avatar
  has_one_attached :qr_code

  belongs_to :portfolio
  belongs_to :user

  has_many :reactions, dependent: :destroy
  has_many :likes, -> { where reaction_type: 'like' }, class_name: 'Reaction'
  has_many :dislikes, -> { where reaction_type: 'dislike' }, class_name: 'Reaction'

  validates :title, presence: true
  validates :description, presence: true
  validates :portfolio_id, presence: true
  validates :user_id, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[title description]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end

  def likes_count
    likes.count
  end

  def dislikes_count
    dislikes.count
  end
end
