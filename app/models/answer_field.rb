class AnswerField < ApplicationRecord
  belongs_to :answer
  belongs_to :field

  validates :text_body, presence: true, if: :text?
  validates :string_body, presence: true, if: :string?

  validate :text_body_blank_if_not_text
  validate :string_body_blank_if_not_string

  def text?
    field&.kind == 'text'
  end

  def string?
    field&.kind == 'string'
  end

  def body
    text? ? text_body : string_body
  end

  def outdated?
    @outdated ||= field.outdated?
  end

  def outdate_answer
    return if answer.outdated?

    answer.outdated = true
    answer.save
  end

  private

  def text_body_blank_if_not_text
    return if text_body.blank?

    errors.add(:text_body, 'must be blank') if string?
  end

  def string_body_blank_if_not_string
    return if string_body.blank?

    errors.add(:string_body, 'must be blank') if text?
  end
end
