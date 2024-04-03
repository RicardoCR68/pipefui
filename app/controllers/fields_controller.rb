class FieldsController < ApplicationController
  before_action :set_field, only: %i[edit update destroy]
  before_action :set_form

  def new
    @field = Field.new
  end

  def create
    @field = Field.new(field_params)
    @field.form = @form

    if @field.save
      redirect_to form_path(@form)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @field.update(field_params)
      redirect_to form_path(@field.form)
    else
      render :edit
    end
  end

  def destroy
    if @field.destroy
      redirect_to form_path(@field.form)
    else
      render :show
    end
  end

  private

  def set_field
    @field = Field.find(params[:id])
  end

  def set_form
    @form = Form.find(params[:form_id])
  end

  def field_params
    params.require(:field).permit(:kind, :label)
  end
end
