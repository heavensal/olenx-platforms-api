class QrCode < ApplicationRecord
  belongs_to :user
  belongs_to :idea
  belongs_to :project
end
