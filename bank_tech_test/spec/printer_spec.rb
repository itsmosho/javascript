require 'printer'

describe Printer do
    let(:printer) { Printer.new }
    let(:transaction1) { double(:transaction, date: '10/01/2012', credit: '', debit: '1000.00', balance: '1000.00') }
    let(:transaction2) { double(:transaction, date: '13/01/2012', credit: '', debit: '2000.00', balance: '3000.00') }
  
    describe '#print_format' do
      it 'prints the full bank statement' do
        heading = "date || credit || debit || balance\n"
        transaction = "10/01/2012 ||  || 1000.00 || 1000.00\n"
        bank_statement = [transaction1]
        expected_statement = heading + transaction
        expect { printer.print_format(bank_statement) }
          .to output(expected_statement).to_stdout
      end
      it 'prints the most recent transaction first' do
        expected_heading = "date || credit || debit || balance\n"
        expected_transaction = "10/01/2012 ||  || 1000.00 || 1000.00\n"
        expected_transaction2 = "13/01/2012 ||  || 2000.00 || 3000.00\n"
        bank_statement = [transaction1, transaction2]
        expected_statement = expected_heading + expected_transaction2 + expected_transaction
        expect { printer.print_format(bank_statement) }
          .to output(expected_statement).to_stdout
      end
    end
  end