class Form < ApplicationRecord
  has_many :fields
  has_many :answers

  validates :title, presence: true

  def valid_fields
    fields.where(outdated: false)
  end
end
