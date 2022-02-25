# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MonthlySalaryControllerController', type: :request do
  describe 'POST #create' do
    let(:request) { post '/monthly_salary', params: params }
    let(:params) { { 'employee_name': 'Rin', 'annual_salary': 60000 } }
    let(:expected_result) { { 'employee_name' => 'Rin', 'gross_monthly_income' => '5000.00', 'monthly_income_tax' => '500.00', 'net_monthly_income' => '4500.00' } }
    context 'create data for employee salary' do
      it 'should add new entry' do
        expect { request }.to change(EmployeeSalary, :count).from(0).to(1)
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #index' do
    let(:request) { get '/monthly_salary' }
    context 'show all data' do
      let!(:employee_salary) do
        { 'salary_computations': [create(:employee_salary)] }.to_json
      end
      it 'should return json data' do
        request
        expect(response.body).to eq(employee_salary)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
