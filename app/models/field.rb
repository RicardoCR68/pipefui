# frozen_string_literal: true

class Field < ApplicationRecord
  belongs_to :form

  validates :kind, presence: true, inclusion: { in: %w[text string] }

  validates :text_body, presence: true, if: :text?
  validates :string_body, presence: true, if: :string?

  validate :text_body_empty_for_string_kind
  validate :string_body_empty_for_text_kind

  def body
    text? ? text_body : string_body
  end

  def text_body_empty_for_string_kind
    return unless string?

    errors.add(:string_body, 'cannot be empty') if string_body.blank?
    errors.add(:text_body, 'must be empty') unless text_body.blank?
  end

  def string_body_empty_for_text_kind
    return unless text?

    errors.add(:text_body, 'cannot be empty') if text_body.blank?
    errors.add(:string_body, 'must be empty') unless string_body.blank?
  end

  private

  def text?
    kind == 'text'
  end

  def string?
    kind == 'string'
  end
end
