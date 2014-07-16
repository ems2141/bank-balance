class BankBalance

  def initialize(cc_statement)
    @cc_statement = cc_statement
  end

  def credit_card_total
    total = []

    lines = @cc_statement.pop(@cc_statement.length-1)

    lines.each do |line|
       total << line.last
    end

    array_of_nums = total.map{|x| x.gsub("$","").to_i}
    sum = array_of_nums.inject{|sum,x| sum + x }
    "$" + sum.to_s
  end
end