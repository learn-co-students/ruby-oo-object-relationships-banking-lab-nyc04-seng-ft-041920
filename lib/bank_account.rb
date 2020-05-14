require 'pry'

class BankAccount
  attr_reader :name # bc name doesn't change
  attr_accessor :balance, :status

  # can also work with default
  def initialize(name, balance=1000)
    @name = name
    @balance = balance
    @status = 'open'
  end

  def deposit(amt)
    self.balance += amt
  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == 'open' && self.balance > 0
  end

  def close_account
    self.status = 'closed'
  end

end
