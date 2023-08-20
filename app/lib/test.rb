class Calculate
  attr_reader :num
  def initialize(num)
    @num = num
  end

  def half_num
    @num / 2
  end

  # numがあれば、true
  # numがないと、false
  def present?
    num != nil
  end
end
