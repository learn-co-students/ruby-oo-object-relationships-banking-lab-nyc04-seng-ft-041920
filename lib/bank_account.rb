class BankAccount


        @@all = []
    
        attr_reader :name 
        attr_accessor :balance, :status 
    
        def initialize (name)
            @name = name 
            @balance = 1000 
            @status = "open"
            @@all << self 
            
        end 
    
        def self.all 
            @@all 
        end 
    
        def deposit(amount)
            @balance += amount 
        end 
    
        def display_balance
            "Your balance is $#{@balance}."
        end 
    
        def valid? 
           if @status=="open" && @balance > 0
             @@all.each do |account| 
                if account == self 
                  return true 
                end 
               end
              false 
            else 
                false 
            end 
        end 
    
        def close_account
            @status = "closed"
        end 
    end
    
    
    