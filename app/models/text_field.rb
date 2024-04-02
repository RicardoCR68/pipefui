class TextField < ApplicationRecord
  belongs_to :form

  validates :body, presence: true
end
