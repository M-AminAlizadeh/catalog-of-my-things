require_relative '../classes/item'
require_relative '../classes/game_class'
require 'rspec'

describe Game do
  before(:each) do
    @game = Game.new(true, '2023-10-17')
  end

  describe '#initialize method' do
    it 'check for the Game instance' do
      expect(@game).to be_an_instance_of(Game)
    end

    it 'check for the multiplayer' do
      expect(@game.multiplayer).to eq(true)
    end

    it 'check for the last_played_at' do
      expect(@game.last_played_at).to eq('2023-10-17')
    end

    it 'check if not a multiplayer' do
      game = Game.new(false, '2023-10-17')
      expect(game.multiplayer).to eq(false)
    end
  end

  # describe '#can_be_archived? method' do
  #    it 'check the method to return true' do
  #         item = Item.new('2001-08-12')
  #         check = @game.send(:can_be_archived?, item)
  #         expect(check).to eq(true)
  #     end

  #     it 'check the method to return false' do
  #         item = Item.new('2019-08-12')
  #         check = @game.send(:can_be_archived?, item)
  #         expect(check).to eq(false)
  #     end
  # end
end
