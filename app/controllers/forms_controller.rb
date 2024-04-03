# frozen_string_literal: true

class FormsController < ApplicationController
  before_action :set_form, only: %i[show edit update destroy]

  def index
    @forms = Form.all.includes(:fields).order(created_at: :desc)
  end

  def show; end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)

    if @form.save
      redirect_to form_path(@form)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @form.update(form_params)
      redirect_to form_path(@form)
    else
      render :edit
    end
  end

  def destroy
    if @form.destroy
      redirect_to forms_path
    else
      render :show
    end
  end

  private

  def set_form
    @form = Form.find(params[:id])
  end

  def form_params
    params.require(:form).permit(:title, fields_attributes: %i[id kind text_body string_body _destroy])
  end
end
