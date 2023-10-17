require_relative '../item'
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
end
