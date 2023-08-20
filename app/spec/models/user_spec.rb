require_relative '../../models/user'

RSpec.describe User do
  describe '#present?' do
    context 'idが存在する時' do
      it 'trueになる' do
        user = User.new(id: 1, email: 'hoge@example.com', password: 'password')
        expect(user.present?).to eq true
      end
    end

    context 'idが存在しない時' do
      it 'falseになる' do
        user = User.new(id: nil, email: 'hoge@example.com', password: 'password')
        expect(user.present?).to eq false
      end
    end
  end
end
