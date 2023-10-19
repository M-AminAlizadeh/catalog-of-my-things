require_relative '../classes/item'
require 'rspec'

describe Item do
  before(:each) do
    @item = Item.new('2001-08-12')
  end

  describe '#initialize method' do
    it 'check the instance' do
      expect(@item).to be_an_instance_of(Item)
    end

    it 'check the publish_date' do
      expect(@item.publish_date).to eq('2001-08-12')
    end

    it 'check the publish_date' do
      expect(@item.archived).to eq(false)
    end
  end

  describe '#author setter method' do
    it 'should add the author to items' do
      author = double('Author')
      allow(author).to receive(:items).and_return([])
      @item.author = author
      expect(@item.author).to eq author
    end
  end

  describe '#label setter method' do
    it 'assigns a label to an item' do
      label = double('Label')
      allow(label).to receive(:items).and_return([])
      @item.label = label
      expect(@item.label).to eq label
    end
  end

  describe '#genre setter method' do
    it 'assigns a genre to an item' do
      genre = double('Genre')
      allow(genre).to receive(:items).and_return([])
      @item.genre = genre
      expect(@item.genre).to eq genre
    end
  end

  describe '#move_to_archive' do
    it 'archives the item when can_be_archived? returns true' do
      allow(@item).to receive(:can_be_archived?).and_return(true)
      @item.move_to_archive
      expect(@item.archived).to be(true)
    end

    it 'does not archive the item when can_be_archived? returns false' do
      allow(@item).to receive(:can_be_archived?).and_return(false)
      @item.move_to_archive
      expect(@item.archived).to be(false)
    end
  end
end
