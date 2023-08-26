require_relative '../lib/test'

RSpec.describe Calculate do

  describe '#harf_num' do
    context '正常な時' do
      it '1000の半分は500になる' do
        calculate = Calculate.new(1000)
        expect(calculate.half_num).to eq 500
      end
    end
  end

  describe '#present?' do
    context 'numが存在する時' do
      it 'trueになる' do
        calculate = Calculate.new(1000)
        expect(calculate.present?).to eq true
      end
    end

    context 'numが存在しない時' do
      it 'falseになる' do
        calculate_1 = Calculate.new(nil)
        expect(calculate_1.present?).to eq false
      end
    end
  end
end
