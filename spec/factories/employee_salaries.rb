# frozen_string_literal: true

FactoryBot.define do
  factory :employee_salary do
    employee_name { 'Rin' }
    annual_salary { '60000.00' }
    monthly_income_tax { '500.00' }
  end
end
