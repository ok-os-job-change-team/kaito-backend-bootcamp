class User
  attr_reader :id, :email, :password, :created_at, :updated_at

  def initialize(id:, email:, password:, created_at: Time.now, updated_at: Time.now)
    @id = id
    @email = email
    @password = password
    @created_at = created_at
    @updated_at = updated_at
  end

  def present?
    id != nil 
  end
end
