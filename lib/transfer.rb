#require_relative 'lib/bank_account'
require 'pry'

class Transfer
  # your code here

    attr_reader :sender, :receiver
    attr_accessor :status, :amount

    def initialize(sender, receiver, status="pending", amount)
      @sender = sender
      @receiver = receiver
      @status = status
      @amount = amount
    end

    def valid?
      if sender.valid? && receiver.valid?
          true
      else 
        false
      end
      #binding.pry
    end

    def execute_transaction
      if sender.balance > amount && self.valid? && self.status != "complete"
        # do it
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete"
      else 
        # dont do it
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if self.status == "complete"
        sender.balance += amount
        receiver.balance -= amount
        self.status = "reversed"
      end
    end
end