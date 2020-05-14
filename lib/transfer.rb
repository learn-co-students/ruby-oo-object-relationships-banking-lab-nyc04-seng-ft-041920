class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount, status="pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end


    def valid?
      if sender.valid? && receiver.valid?
        true
      else
        false
      end
    end
    
   def execute_transaction
     if valid? && @sender.balance > @amount && @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount 
        @status = "complete"
     else
        @status = "rejected"
         return "Transaction rejected. Please check your account balance."
      end
    
   end

   
    def reverse_transfer
      if @status == "complete" 
        @receiver.balance -= @amount
        @sender.deposit(@amount) 
        @status = "reversed"
      end
     end
    

   


end