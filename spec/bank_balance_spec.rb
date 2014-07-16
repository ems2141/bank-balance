require 'spec_helper'
require_relative '../lib/bank_balance'
require 'csv'

describe BankBalance do
  it 'can determine how much is spent via CC' do
    sample_data_path = File.expand_path('spec/fixtures/sample-credit-card.csv')
    parsed_csv = CSV.read(sample_data_path)

<<<<<<< HEAD
    expect(BankBalance.new(parsed_csv).credit_card_total).to eq "$15.01"
=======
    expect(BankBalance.new(parsed_csv).credit_card_total).to eq "$15"
>>>>>>> 072a48cf5ec313d305b9ff435f1198b19419afb3
  end
end