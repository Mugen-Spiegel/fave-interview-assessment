class CreateEmployeeSalaries < ActiveRecord::Migration[6.0]
  def change
    create_table :employee_salaries do |t|
      t.string :employee_name
      t.string :annual_salary
      t.string :monthly_income_tax

      t.timestamps
    end
  end
end
