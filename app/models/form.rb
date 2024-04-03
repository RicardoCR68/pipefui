class Form < ApplicationRecord
  has_many :fields
  accepts_nested_attributes_for :fields

  validates :title, presence: true
end
