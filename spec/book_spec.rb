require 'rspec'
require_relative '../classes/book'
require_relative '../classes/item'

describe Book do
  let(:book) { Book.new('2023-10-17', 'Wiley', 'good') }

  describe '#new' do
    it 'returns a new Book object' do
      expect(book).to be_instance_of(Book)
    end

    it 'returns a kind of Item' do
      expect(book).to be_kind_of Item
    end
  end

  describe '#publisher' do
    it 'returns the correct publisher' do
      expect(book.publisher).to eql 'Wiley'
    end
  end

  describe '#cover_state' do
    it 'returns the correct cover_state' do
      expect(book.cover_state).to eql 'good'
    end
  end

  describe '#can_be_archived?' do
    it 'returns true when cover_state equals "bad"' do
      book.cover_state = 'bad'
      expect(book.can_be_archived?).to be(true)
    end

    it 'returns false when cover_state equals "good"' do
      book.cover_state = 'good'
      expect(book.can_be_archived?).to be(false)
    end

    it 'returns false when cover_state not equals "bad" and the super method returns false' do
      allow(book).to receive(:super).and_return(false)
      expect(book.can_be_archived?).to be(false)
    end
  end
end
