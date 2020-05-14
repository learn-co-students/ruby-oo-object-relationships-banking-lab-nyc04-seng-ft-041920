class Transfer
  # your code here
  attr_accessor :status, :amount
  attr_reader :sender, :receiver, :original_amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @original_amount = amount
    @status = "pending"
  end
  def valid? 
    @sender.valid? && @receiver.valid?
  end
  def execute_transaction
    if self.amount > @sender.balance || self.valid? == false
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      @sender.balance -= self.amount
      @receiver.deposit(self.amount)
      self.status = "complete"
      self.amount = 0
    end
  end
  def reverse_transfer
    if self.status == "complete"
      @receiver.balance -= self.original_amount
      @sender.deposit(self.original_amount)
      self.status = "reversed"
    end
  end
end