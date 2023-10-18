require_relative '../Games/author_class'
require 'rspec'

describe Author do
  before(:each) do
    @author = Author.new('FirstName', 'LastName')
    @id = 1
    @items = []
  end

  describe '#initialize constructor' do
    it 'Checking Game instance' do
      expect(@author).to be_an_instance_of(Author)
    end

    it 'Checking the first_name' do
      expect(@author.first_name).to eq('FirstName')
    end

    it 'Checking the last_name' do
      expect(@author.last_name).to eq('LastName')
    end
  end

  describe '#add_item method' do
    it 'should add the author to items' do
      item = double('item')
      allow(item).to receive(:author=)
      @author.add_item(item)
      expect(@author.items).to eq([item])
    end
  end
end
