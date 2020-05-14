class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && self.sender.balance >= self.amount && self.status != "complete"# checks if accounts valid and if enough funds
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && self.status == "complete"# checks if accounts valid and if enough funds
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
    
end

=begin
1. We're going to initialize sender, receiver and status
  attr_reader :sender, :receiver
  attr_accessor :status

  def initialize(sender, receiver, status="pending")
    @sender = sender
    @receiver = receiver
    @pending = pending
  end

2.

3.

4.
=end