class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def check_sender_balance?
    self.sender.balance >= self.amount
  end

  def reject
    self.status = "rejected"
    say = "Transaction rejected. Please check your account balance."
  end

  def transfer
    self.sender.balance -= self.amount
    self.receiver.deposit(self.amount)
    self.status = "complete"
  end
  
  def execute_transaction
    if !self.valid? || !self.check_sender_balance?
      self.reject
    elsif self.status == "pending" 
     self.transfer
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.deposit(self.amount)
      self.status = "reversed"
    end
  end
end
