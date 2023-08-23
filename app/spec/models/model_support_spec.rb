require_relative '../../models/user'
require_relative '../../models/model_support'

RSpec.describe User do

  describe 'present?メソッド' do
    context 'idがある場合' do
    it 'true' do
        class User
          include Model::Support
        end
        user = User.new(id: 1, email: 'kaito@exampe.co.jp', password: 'p@ssw0rd_1', created_at: '2023-08-22', updated_at: '2023-08-22')
        expect(user.present?).to eq true
      end
    end

    context 'idがない場合' do
      it 'false' do
          class User
            include Model::Support
          end
          user = User.new(id: nil, email: 'kaito@exampe.co.jp', password: 'p@ssw0rd_1', created_at: '2023-08-22', updated_at: '2023-08-22')
          expect(user.present?).to eq false
        end
      end
  end

  describe 'blank?メソッド' do
    context 'idがある場合' do
    it 'false' do
        class User
          include Model::Support
        end
        user = User.new(id: 1, email: 'kaito@exampe.co.jp', password: 'p@ssw0rd_1', created_at: '2023-08-22', updated_at: '2023-08-22')
        expect(user.blank?).to eq false
      end
    end

    context 'idがない場合' do
      it 'true' do
          class User
            include Model::Support
          end
          user = User.new(id: nil, email: 'kaito@exampe.co.jp', password: 'p@ssw0rd_1', created_at: '2023-08-22', updated_at: '2023-08-22')
          expect(user.blank?).to eq true
        end
      end
  end
end




  # describe 'rainbow' do
  #   context '文字列の場合' do
  #     it '虹色に変換される' do
  #       expected = "\e[31mH\e[32me\e[33ml\e[34ml\e[35mo\e[36m,\e[31m \e[32mw\e[33mo\e[34mr\e[35ml\e[36md\e[31m!\e[0m"
  #       expect('Hello, world!'.rainbow).to eq expected
  #       puts 'Hello,world!'.rainbow
  #     end
  #   end

#     context '配列の場合'do
#       it '虹色に変換される' do
#         expected = "\e[31m[\e[32m1\e[33m,\e[34m \e[35m2\e[36m,\e[31m \e[32m3\e[33m]\e[0m"
#         expect([1, 2, 3].rainbow).to eq expected
#         puts [1, 2, 3].rainbow
#       end
#     end
#   end
# end
