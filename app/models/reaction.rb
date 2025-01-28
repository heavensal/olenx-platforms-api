class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  validates reaction_type, presence: true
  validates :user_id, uniqueness: { scope: :idea_id }
  validates :reaction_type, inclusion: { in: %w[like dislike] }
end
