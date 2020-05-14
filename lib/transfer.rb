require "pry"

class Transfer
  attr_accessor :receiver, :amount 
  attr_reader :sender, :status
  def initialize(sender,receiver, amount)
    @amount = amount
    @sender = sender 
    @receiver = receiver
    @status = "pending"
  end

  def sender
    @sender
  end

  def receiver
    @receiver
  end

  def status 
    @status
  end
  
  def valid?
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
      if @sender.valid? == false 
      return "Transaction rejected. Please check your account balance." 
     end
    if self.valid? && @status == "pending" && @sender.balance > amount
      @status = "complete"  
    @sender.balance = @sender.balance - amount
    @receiver.balance = @receiver.balance += amount
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance." 
    end
  end
  
  def reverse_transfer
    if @status == "complete"
    @sender.balance = @sender.balance += amount
    @receiver.balance = @receiver.balance -= amount
    @status = "reversed"
    end
  end
end
