class Form < ApplicationRecord
  has_many :text_fields
  has_many :string_fields

  validates :title, presence: true
end
