# frozen_string_literal: true

class Field < ApplicationRecord
  belongs_to :form
  has_many :answer_fields

  validates :kind, presence: true, inclusion: { in: %w[text string] }
  validates :label, presence: true
end
