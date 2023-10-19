require_relative '../classes/item'
require_relative '../classes/game_class'
require 'rspec'

describe Game do
  before(:each) do
    @game = Game.new(true, '2019-10-17', '2022-10-17')
    @game.id = 1
  end

  describe '#initialize method' do
    it 'check for the Game instance' do
      expect(@game).to be_an_instance_of(Game)
    end

    it 'check for the multiplayer' do
      expect(@game.multiplayer).to eq(true)
    end

    it 'check for the last_played_at' do
      expect(@game.last_played_at).to eq('2019-10-17')
    end

    it 'check for the last_played_at' do
      expect(@game.publish_date).to eq('2022-10-17')
    end

    it 'check for the archived from the parent class when condition not met' do
      expect(@game.archived).to eq(false)
    end

    it 'check for the archived from parent class when one of the parameters is false' do
      game = Game.new(false, '2023-10-17', '2022-10-17')
      expect(game.archived).to eq(false)
    end

    it 'check if not a multiplayer' do
      game = Game.new(false, '2023-10-17', '2002-10-17')
      expect(game.multiplayer).to eq(false)
    end

    it 'check if not a multiplayer' do
      game = Game.new(false, '12-08-2001', '20-11-2004')
      expect(game.multiplayer).to eq(false)
    end
  end

  describe '#can_be_archived? method' do
    it 'returns false, if one of the last_played_at, publish_date is false' do
      expect(@game.can_be_archived?).to eq(false)
    end

    it 'returns true if last_played_at, publish_date are true' do
      game = Game.new(true, '2021-10-17', '2002-10-17')
      expect(game.can_be_archived?).to eq(true)
    end
  end

  describe '#to_json' do
    it 'JSON string of the Game object' do
      s = '{"id":1,"multiplayer":true,"last_played_at":"2019-10-17","publish_date":"2022-10-17","archived":false,"label":null,"author":null,"genre":null}'
      expect(@game.to_json).to eq(s)
    end

    it 'JSON string of the empty game object' do
      game = Game.new(true, nil, nil)
      game.id = 2
      s = '{"id":2,"multiplayer":true,"last_played_at":null,"publish_date":null,"archived":false,"label":null,"author":null,"genre":null}'
      expect(game.to_json).to eq(s)
    end
  end
end
