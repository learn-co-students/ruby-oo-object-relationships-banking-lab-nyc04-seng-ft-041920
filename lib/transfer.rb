# require_all 'lib'

class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount
  
  
  def initialize(sender, receiver, amount = 50, status = "pending")
   
   @receiver = receiver
   @sender = sender
   @status = status
   @amount = amount
  end
  
    def valid?
      if receiver.valid?  && sender.valid? 
        true
      else
        false
      end
    end
  
    def execute_transaction
      
      valid_balance = self.sender.balance >= self.amount 
      
      
      if self.valid? == true && self.status == "pending" && valid_balance && (self.receiver.status == "open" && self.sender.status == "open")
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      
      
      else
        self.status = "rejected"
      
        
        
        "Transaction rejected. Please check your account balance."
      
      end 
        
     
       
      # self.execute_transaction
    
  end
  
  def reverse_transfer
   if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
   end
      
  end
  
  
  
  
  
  
  
  
end