class Form < ApplicationRecord
  has_many :fields

  validates :title, presence: true
end
