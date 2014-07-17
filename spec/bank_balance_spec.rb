require 'spec_helper'
require_relative '../lib/bank_balance'
require 'csv'

describe BankBalance do
  it 'can give you a balance for one month' do
    credit_data = File.expand_path('spec/fixtures/sample-credit-card.csv')
    parsed_credit_data = CSV.read(credit_data)

    checking_statement = File.expand_path('spec/fixtures/sample-checking-statement.csv')
    parsed_checking_statement = CSV.read(checking_statement)

    expect(BankBalance.new.balance(parsed_checking_statement, parsed_credit_data)).to eq("$3055.00")
  end
end
