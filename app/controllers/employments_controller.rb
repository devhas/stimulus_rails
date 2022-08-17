# frozen_string_literal: true

class EmploymentsController < ApplicationController
  before_action :set_employment, only: %i[show edit update destroy]

  def index
    @employments = Employment.all
  end

  def show; end

  def new
    employee = Employee.find(params[:employee_id])
    @employment = employee&.employments&.build()
  end

  def edit; end

  def create
    @employment = Employment.new(employment_params)
    employees = Employee.all
    respond_to do |format|
      @employment.save
      format.turbo_stream do
        render turbo_stream: turbo_stream.update(
          'index_home',
          partial: "home/records", 
          :locals => {:@employees => employees}
        )
      end
    end
  end

  def update
    respond_to do |format|
      @employment.update(employment_params)
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          'employee_form',
          partial: 'employments/form',
          locals: { employment: @employment }
        )
      end
    end
  end

  def destroy
    @employment.destroy

    respond_to do |format|
      format.html { redirect_to employments_url, notice: 'Employment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_employment
    @employment = Employment.find(params[:id])
  end

  def employment_params
    params.require(:employment).permit(:employer, :date_started, :date_employment_ended, :employee_id)
  end
end
