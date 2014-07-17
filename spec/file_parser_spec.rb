require 'spec_helper'
require_relative '../lib/file_parser'

describe FileParser do
  it 'can return the month of the credit card and checking data' do
    credit_data_path = File.expand_path('spec/fixtures/statement-credit-card-may-2014.csv')

    checking_statement_path = File.expand_path('spec/fixtures/statement-checking-may-2014.csv')

    expect(FileParser.new(credit_data_path, checking_statement_path).get_month_balance('may')).to eq "$87.00"
  end
end