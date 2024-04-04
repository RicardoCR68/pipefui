class Answer < ApplicationRecord
  belongs_to :form

  has_many :answer_fields, dependent: :destroy
  accepts_nested_attributes_for :answer_fields

  validates :email, presence: true
end
