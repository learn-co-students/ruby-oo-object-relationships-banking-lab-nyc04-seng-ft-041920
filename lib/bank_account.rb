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











