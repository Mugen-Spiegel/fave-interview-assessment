# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::EmployeeSalaryService::Create do
  context 'compute total tax' do
    let(:expected_result) { { 'employee_name' => 'Rin', 'gross_monthly_income' => '5000.00', 'monthly_income_tax' => '500.00', 'net_monthly_income' => '4500.00' } }
    let(:instance) { described_class.new('Rin', 60_000) }
    it 'should return object that has gross_monthly_income, monthly_income_tax, net_monthly_income property' do
      expect(instance.call).to eq(expected_result)
    end
  end
end
