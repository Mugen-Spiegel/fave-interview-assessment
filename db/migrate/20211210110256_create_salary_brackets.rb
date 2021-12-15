class CreateSalaryBrackets < ActiveRecord::Migration[6.0]
  def change
    create_table :salary_brackets do |t|
      t.integer :salary_range_from
      t.integer :salary_range_to
      t.string :range_percentage

      t.timestamps
    end
  end
end
