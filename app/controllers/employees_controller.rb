class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    partial = 'form'
    respond_to do |format|
      if @employee.save
        partial = "employments/form"
      end

      format.turbo_stream do
        render turbo_stream: turbo_stream.update(
          "employee_form",
          partial: partial,
          locals: { employee: @employee, employment: @employee&.employments&.build() }
        )
      end
    end
  end

  def update
    respond_to do |format|
      @employee.update(employee_params)
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(
          "employee_form", 
          partial: "form",
          locals: {employee: @employee}
        )
      end
    end
  end

  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :nickname, :email, :phone_number)
    end
end
