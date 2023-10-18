require 'rspec'
require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  let(:label) { Label.new('testing', 'pink') }
  let(:item) { Item.new('2023-10-17') }

  describe '#new' do
    it 'returns a new Label object' do
      expect(label).to be_instance_of(Label)
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      expect(label.title).to eql 'testing'
    end
  end

  describe '#color' do
    it 'return the correct color' do
      expect(label.color).to eql 'pink'
    end
  end

  describe '#add_item' do
    it 'adds the item correctly' do
      label.add_item(item)
      expect(label.items).to include(item)
    end
  end
end
