require_relative '../../models/favorite.rb'

RSpec.describe Favorite do

  describe '#present?' do
    context 'idが存在するとき' do
      it 'trueになる' do
        favorite = Favorite.new(id: 1, user_id: 1, tweet_id: 1)
        expect(favorite.present?).to eq true
      end
    end

    context 'idが存在しない時' do
      it 'falseになる' do
        favorite = Favorite.new(id: nil, user_id: 1, tweet_id: 1)
        expect(favorite.present?).to eq false
      end
    end
  end
end
