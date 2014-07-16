class BankBalance

  def balance(checking_data, credit_card_data)
    checking = total_checking(checking_data)

    month_credit = find_monthly_credits(credit_card_data)
    credit_card = month_credit.gsub("$", "").gsub(",", "").to_f
    number_to_string(checking - credit_card)
  end


  private

  def number_to_string(number)
    "$" + number.to_s
  end

  def find_monthly_credits(cc_data)
    monthly_credits = []
    credit_card_rows = cc_data.pop(cc_data.length-1)

    credit_card_rows.each do |row|
      unless row[1] == "Payment Thank You"
        monthly_credits << row.last
      end
    end

    array_of_nums = monthly_credits.map{|x| x.gsub("$","").to_f}
    sum = array_of_nums.inject{|sum,x| sum + x }
    "$" + sum.to_s
  end

  def total_checking(checking)
    deposit = []
    checks = []
    checking_rows = checking.pop(checking.length-1)
    checking_rows.each do |row|
      unless row[1] == "Payment CC"
        if row[1] == "Deposit Bank"
          deposit << row[2]
        else
          checks << row.last
        end
      end
    end

    deposit_as_float = convert_string_num_to_float(deposit.first)
    checks_as_float = checks.map {|x| convert_string_num_to_float(x)}
    deposit_as_float - checks_as_float.inject{|sum,x| sum + x }
  end

  def convert_string_num_to_float(number)
    number.gsub("$", "").gsub(",", "").to_f
  end
end
