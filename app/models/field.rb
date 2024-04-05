# frozen_string_literal: true

class Field < ApplicationRecord
  belongs_to :form
  has_many :answer_fields

  validates :kind, presence: true, inclusion: { in: %w[text string] }
  validates :label, presence: true

  def outdated?
    outdated
  end

  def string?
    kind == 'string'
  end

  def text?
    kind == 'text'
  end

  def outdate_answer_fields
    answer_fields.update_all(outdated: true)
    answer_fields.each(&:outdate_answer)
  end
end
