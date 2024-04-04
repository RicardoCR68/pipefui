class AnswersController < ApplicationController
  before_action :set_answer, only: %i[show edit update destroy]
  before_action :set_form

  def index
    @answers = @form.answers
  end

  def new
    @answer = @form.answers.new
    @form.fields.each do |field|
      @answer.answer_fields.build(field:)
    end
  end

  def create
    @answer = @form.answers.new(answer_params)

    if @answer.save
      redirect_to form_answer_path(@form, @answer)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @answer.update(answer_params)
      redirect_to form_answer_path(@form, @answer)
    else
      render :edit
    end
  end

  def destroy
    if @answer.destroy
      redirect_to form_path(@form)
    else
      render :show
    end
  end

  private

  def set_answer
    @answer = Answer.includes(answer_fields: :field).find(params[:id])
  end

  def set_form
    @form = Form.find(params[:form_id])
  end

  def answer_params
    params.require(:answer).permit(:email, answer_fields_attributes: %i[field_id text_body string_body])
  end
end
