require 'minitest/autorun'
require_relative '../lib/gate'
require_relative '../lib/ticket'

class GareTest < Minitest::Test

  def setup 
    # 改札機オブジェクトの作成
    @umeda = Gate.new(:umeda)
    @juso = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)
  end

  # テストシナリオ1 => 160円の切符を購入して梅田で乗車し、十三で降車する
  def test_umeda_to_juso
    ticket = Ticket.new(160)
    @umeda.enter(ticket)
    assert @juso.exit(ticket)
  end

  # テストシナリオ2 =>  160円の切符を購入して梅田で乗車し、三国で降車する
  def test_umeda_to_mikuni_when_fare_is_not_enough
    ticket = Ticket.new(160)
    @umeda.enter(ticket)
    refute @mikuni.exit(ticket)
  end

  # テストシナリオ3 =>  190円の切符を購入して梅田で乗車し、三国で降車する
  def test_umeda_to_mikuni_when_fare_is_enough
    ticket = Ticket.new(190)
    @umeda.enter(ticket)
    assert @mikuni.exit(ticket)
  end

  # テストシナリオ4 =>  160円の切符を購入して十三で乗車し、三国で降車する
  def test_juso_to_mikuni
    ticket = Ticket.new(160)
    @juso.enter(ticket)
    assert @mikuni.exit(ticket)
  end
end
