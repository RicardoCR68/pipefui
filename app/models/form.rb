class Form < ApplicationRecord
  has_many :fields
  has_many :answers

  validates :title, presence: true
end
