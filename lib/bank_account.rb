require 'pry'
# require_relative '../lib/transfer'

class BankAccount
    attr_accessor :balance, :status
    attr_reader :name
    # We're going to build a `BankAccount` class where one instance of the class can transfer money to another instance through a `Transfer` class. 
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(amount)
        self.balance += amount
    end

    def display_balance
        "Your balance is $#{@balance}."
    end
    
    def valid? #valid? is valid with an open status and a balance greater than 0
        @status == "open" && @balance > 0
    end

    def close_account
        @status = "closed"
    end

    
    # The `Transfer` class acts as a space for a transaction between two instances of the bank account class.

    # Think of it this way: you can't just transfer money to another account without the bank running checks first.

    # `Transfer` instances will do all of this, as well as check the validity of the accounts before the transaction occurs.

    # `Transfer` instances should be able to reject a transfer if the accounts aren't valid or if the sender doesn't have the money.

    # Transfers start out in a "pending" status. They can be executed and go to a "complete" state. 

    # They can also go to a "rejected" status. A completed transfer can also be reversed and go into a "reversed" status.

    
 end
