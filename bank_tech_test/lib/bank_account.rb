require 'transaction'
require 'printer'

class BankAccount
    DEFAULT_BALANCE = 0

  attr_reader :balance, :bank_statement

  def initialize(transaction, printer)
    @balance = DEFAULT_BALANCE
    @bank_statement = []
    @transaction = transaction
    @printer = printer
  end

  def deposit(date, credit)
    update_balance(date, credit: credit)
  end

  def withdraw(date, debit)
    raise 'Insufficient funds' if balance < debit
    update_balance(date, debit: debit)
  end

  def print_statement
    printer = @printer.new
    printer.print_format(@bank_statement)
  end


  def update_balance(date, credit: nil, debit: nil)
    @balance += credit if credit
    @balance -= debit if debit
    create_transaction(date, credit, debit, @balance)
  end


  def create_transaction(date, credit, debit, balance)
    transaction = @transaction.new(date, credit, debit, balance)
    @bank_statement << transaction
  end

end