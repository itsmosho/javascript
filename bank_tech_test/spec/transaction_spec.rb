require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new('10-01-2012', 0, 1000, 1000) }

  describe 'Transction' do
    it 'has a balance' do
      expect(transaction.balance).to eq(1000)
    end
    it 'has a date' do
      expect(transaction.date).to eq('10-01-2012')
    end
    it 'has a value for debit' do
      expect(transaction.debit).to eq(1000)
    end
    it 'has a value for credit' do
      expect(transaction.credit).to eq(0)
    end
  end
end