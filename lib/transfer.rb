require_relative 'bank_account'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  # @@transfer_counter = 0
  def initialize(sender, reciever, amount)
      @sender = sender
      @receiver = reciever
      @amount = amount
      @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status == 'pending' && sender.balance > self.amount && self.valid?
    sender.balance -= amount
    receiver.balance += amount
    self.status = "complete"
    else 
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
        receiver.balance -= amount
        sender.balance += amount
        self.status = "reversed"
    end
end


end
