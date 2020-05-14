class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name, balance = 1000, status = "open")
        @name = name
        @balance = balance
        @status = status
    end

    def deposit(num)
        self.balance += num
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if self.balance > 0 && self.status == "open"
            true
        else
            false
        end
    end

    def close_account
        if self.status == "open"
            self.status = "closed"
        end
    end
end

=begin
1. We're going to have attributes: name, balance, and status
 * :name cannot be changeable       :: attr_reader
 * :balance has a default of 1000   :: attr_accessor
 * :status has a default of open    :: attr_accessor

2. We need a method for deposit which increases balance
    def deposit(num)
        self.balance += num
    end
3. We need a method to display balance
    def display_balance
        self.balance # "Your balance is $#{self.balance}."
    end

4. We need a method to check if the bank account is valid.
  * :status must be open
  * :balance must be greater than 0
  * If neither of these conditions are true then return false

    def valid?
        if self.balance > 0 && self.status == "open"
            true
        else
            false
        end
    end

5. We need a method to change :status to closed
    def close_account
        if self.status == "open"
            self.status = "closed"
        end
    end
=end