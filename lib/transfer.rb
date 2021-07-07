require 'pry'
# require_relative '../lib/bank_account'

class Transfer
attr_accessor :receiver, :status, :amount
attr_reader :sender

def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
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
    else @status = "rejected"
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

 # The `Transfer` class acts as a space for a transaction between two instances of the bank account class.

    # Think of it this way: you can't just transfer money to another account without the bank running checks first.

    # `Transfer` instances will do all of this, as well as check the validity of the accounts before the transaction occurs.

    # `Transfer` instances should be able to reject a transfer if the accounts aren't valid or if the sender doesn't have the money.

    # Transfers start out in a "pending" status. They can be executed and go to a "complete" state. 

    # They can also go to a "rejected" status. A completed transfer can also be reversed and go into a "reversed" status
