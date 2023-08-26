require_relative '../../models/model/support.rb'

RSpec.describe Model::Support do

  class TestModel
    include Model::Support 
    
    attr_reader :id
  
    def initialize(id)
      @id = id
    end
  end

  describe 'present?メソッド' do
    context 'idがある場合' do
      it 'trueが返る' do
        test_model = TestModel.new(1)
        expect(test_model.present?).to eq true
      end
    end

    context 'idがnilの場合' do
      it 'falseが返る' do
        test_model = TestModel.new(nil)
        expect(test_model.present?).to eq false
      end
    end

    context 'idが空文字の場合' do
      it 'falseが返る' do
        test_model = TestModel.new('')
        expect(test_model.present?).to eq false
      end
    end
  end

  describe 'blank?メソッド' do
    context 'idがある場合' do
      it 'falseが返る' do
        test_model = TestModel.new(1)
        expect(test_model.blank?).to eq false
      end
    end

    context 'idがnilの場合' do
      it 'trueが返る' do
        test_model = TestModel.new(nil)
        expect(test_model.blank?).to eq true
      end
    end

    context 'idが空文字の場合' do
      it 'trueが返る' do
        test_model = TestModel.new('')
        expect(test_model.blank?).to eq true
      end
    end
  end
end
