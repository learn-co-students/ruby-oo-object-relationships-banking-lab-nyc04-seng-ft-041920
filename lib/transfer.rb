class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :transactions_performed, :status

  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount 
    @status = "pending"
    @transactions_performed = false 
  end 

  def valid?
    @sender.valid? && @receiver.valid? 
  end 

  def execute_transaction
     if self.valid? && !@transactions_performed
        if @sender.balance > @amount
          @sender.balance -= @amount 
          @receiver.balance += @amount
          @transactions_performed = true 
          @status = "complete"
        else 
           @status = "rejected"
          "Transaction rejected. Please check your account balance."
        end 
    else 
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer
      if transactions_performed
        @sender.balance += @amount 
        @receiver.balance -= @amount
        @transactions_performed = false  
        @status = "reversed"
      end 
  end 


end


