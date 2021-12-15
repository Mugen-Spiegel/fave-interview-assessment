# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MonthlySalaryControllerController', type: :request do
  describe 'POST #create' do
    let(:request) { post '/monthly_salary', params: params }
    let(:params) { { 'employee_name': 'Rin', 'annual_salary': 60_000 } }
    context 'create data for employee salary' do
      it 'should add new entry' do
        expect { request }.to change(EmployeeSalary, :count).from(0).to(1)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
