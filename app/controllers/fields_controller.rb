class FieldsController < ApplicationController
  before_action :set_field, only: %i[outdate_field]
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

  def outdate_field
    @field.outdated = true
    if @field.save
      @field.outdate_answer_fields

      redirect_to form_path(@field.form)
    else
      redirect_to form_path(@field.form), status: :unprocessable_entity, alert: @field.errors
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
