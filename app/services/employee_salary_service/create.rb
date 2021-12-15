# frozen_string_literal: true

module EmployeeSalaryService
  class Create
    attr_reader :employee_name, :annual_salary, :total_tax
    def initialize(employee_name, annual_salary)
      @employee_name = employee_name
      @annual_salary = annual_salary
    end

    def call
      compute_total_tax
      # create
      generate_income
    end

    def compute_total_tax
      @total_tax = 0
      remainder = 0
      current_taxable_amount = 0
      salary_bracket = SalaryBracket.all.order(:range_percentage)
      salary_bracket.each do |bracket|
        if bracket.range_percentage != '0'
          if @annual_salary >= bracket.salary_range_to
            current_taxable_amount = (bracket.salary_range_to - (@annual_salary - remainder))
            remainder -= current_taxable_amount
            @total_tax += current_taxable_amount * bracket.range_percentage.to_f
          else
            @total_tax += remainder * bracket.range_percentage.to_f
            break
          end
        else
          remainder += (@annual_salary - bracket.salary_range_to)
        end
      end
    end

    # def create
    #     EmployeeSalary.create!(
    #         employee_name: @employee_name,
    #         annual_salary: @annual_salary,
    #         monthly_income_tax: @total_tax / 12
    #     )
    # end

    def generate_income
      gross_monthly_income = @annual_salary / 12
      monthly_income_tax = @total_tax / 12
      net_monthly_income = gross_monthly_income - monthly_income_tax
      {
        'gross_monthly_income' => sprintf("%.2f", gross_monthly_income),
        'monthly_income_tax' => sprintf("%.2f", monthly_income_tax),
        'net_monthly_income' => sprintf("%.2f", net_monthly_income)
      }
    end
  end
end
