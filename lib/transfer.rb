require 'pry'
require_relative 'bank_account'

class Transfer
    attr_accessor :sender, :receiver, :amount, :status
    # @@transfer_counter = 0
    def initialize(from, to, amount)
        @sender = from
        @receiver = to
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
# avi = BankAccount.new("Avi")
# jeff = BankAccount.new("Jeff")
# transfer1 = Transfer.new(avi, jeff, 15000)
# p transfer1.execute_transaction
# if @@transfer_counter < 1
#   sender.balance -= amount
#   receiver.balance += amount
#   self.status = "complete"
#   @@transfer_counter += 1
# end
#   receiver.balance


