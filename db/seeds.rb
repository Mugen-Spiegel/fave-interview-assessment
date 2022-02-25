# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
salary_range = [
    {
        'range_from' => '0',
        'range_to' => '20000',
        'percentage' => '0',
    },
    {
        'range_from' => '20001',
        'range_to' => '40000',
        'percentage' => '0.10',
    },
    {
        'range_from' => '40001',
        'range_to' => '80000',
        'percentage' => '0.20',
    },
    {
        'range_from' => '80001',
        'range_to' => '180000',
        'percentage' => '0.30',
    },
    {
        'range_from' => '180001',
        'range_to' => '1000000000000',
        'percentage' => '0.40',
    },

]
salary_range.each do |salary|
    SalaryBracket.create(
        salary_range_from: salary['range_from'],
        salary_range_to: salary['range_to'],
        range_percentage: salary['percentage'],
    )
end