class StringField < ApplicationRecord
  belongs_to :form

  validates :body, presence: true, length: { maximum: 255 }
end
