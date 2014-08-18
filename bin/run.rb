require_relative '../lib/file_parser'

credit_data_path = File.expand_path('../data/statement-checking-february-2014.csv')

checking_statement_path = File.expand_path('../data/statement-credit-card-february-2014.csv')

p FileParser.new(credit_data_path, checking_statement_path).get_month_balance('february')