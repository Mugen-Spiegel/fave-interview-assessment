# frozen_string_literal: true

class MonthlySalaryController < ApplicationController
  def create
    permitted_params = param_permit
    employee_monthly_salary = EmployeeSalaryService::Create.new(permitted_params['employee_name'], permitted_params['annual_salary'].to_i).call
    render json: employee_monthly_salary.to_json, status: :ok
  rescue StandardError
    render status: :bad_request
  end

  private

  def param_permit
    params.permit(:employee_name, :annual_salary)
  end
end
