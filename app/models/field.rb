# frozen_string_literal: true

class Field < ApplicationRecord
  belongs_to :form

  validates :kind, presence: true, inclusion: { in: %w[text string] }
  validates :label, presence: true
end
