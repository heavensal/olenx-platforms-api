class QrCode < ApplicationRecord
  belongs_to :user
  belong_to :idea
  belong_to :project

end
