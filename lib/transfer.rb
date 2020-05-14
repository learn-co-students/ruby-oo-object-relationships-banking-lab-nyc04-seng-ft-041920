require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status 

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @status = "pending"
    @amount = amount
  end 

  def valid? 
  @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.sender.balance > self.amount && self.status == "pending" && self.valid? == true 
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount 
      self.status = "complete"

    else 
      self.status = "rejected"
      
      return "Transaction rejected. Please check your account balance."
    end
  end 

def reverse_transfer

  if self.status == "complete"
  self.receiver.balance -= self.amount
  self.sender.balance += self.amount
  self.status = "reversed"
  end 
end

end  
