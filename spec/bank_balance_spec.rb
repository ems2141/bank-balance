require 'spec_helper'
require_relative '../lib/bank_balance'
require 'csv'

describe BankBalance do
  it 'can determine how much is spent via CC' do
    sample_data_path = File.expand_path('spec/fixtures/sample-credit-card.csv')
    parsed_csv = CSV.read(sample_data_path)

    expect(BankBalance.new(parsed_csv).credit_card_total).to eq "$15"
  end
end