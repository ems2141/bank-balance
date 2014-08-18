require 'csv'
require_relative '../lib/bank_balance'

class FileParser

  def initialize(credit_path, checking_path)
    @credit_path = credit_path
    @checking_path = checking_path
  end

  def get_month_balance(month)
    unless @checking_path.match(month) == nil || @credit_path.match(month) == nil
      parsed_credit_data = CSV.read(@credit_path)
      parsed_checking_statement = CSV.read(@checking_path)
      BankBalance.new.balance(parsed_checking_statement, parsed_credit_data)
    end
  end

end