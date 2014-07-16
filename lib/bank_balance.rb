class BankBalance

  def credit_card_total(cc_statement)
    total = []

    lines = cc_statement.pop(cc_statement.length-1)

    lines.each do |line|
       total << line.last
    end

    array_of_nums = total.map{|x| x.gsub("$","").to_f}
    sum = array_of_nums.inject{|sum,x| sum + x }
    "$" + sum.to_s
  end

  def return_balance(statement)
    data = statement.pop(statement.length-1)
    total_debits = []
    data.each do |line|
      unless line.last == nil
        total_debits << line[3]
      end
    end
    array_of_nums = total_debits.map{|x| x.gsub("$","").to_f}
    sum = array_of_nums.inject{|sum,x| sum + x }


    deposit = data.select{|x| x[1] == "Deposit Bank"}
    balance = deposit.first[2].gsub("$", "").gsub(",", "").to_f - sum

    "$" + balance.to_s
  end
end