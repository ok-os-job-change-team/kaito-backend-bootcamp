require_relative './lib/database/client'

class Product
  attr_reader :id, :name, :product_classification, :unit_selling_price, :purchase_unit_price, :registration_date

  # Databseから取得してきたProductsテーブルのレコード群を元に、initializeする
  def self.all
    client = Database::Client.connect_db
    results = client.query("SELECT * FROM products", :symbolize_keys => true)
    results.map do |product_hash|
      self.new(
        id: product_hash[:product_id],
        name: product_hash[:product_name],
        product_classification: product_hash[:product_classification],
        unit_selling_price: product_hash[:unit_selling_price],
        purchase_unit_price: product_hash[:purchase_unit_price],
        registration_date: product_hash[:registration_date]
      )
    end
  end

  def initialize(id:, name:, product_classification:, unit_selling_price:, purchase_unit_price:, registration_date:)
    @id = id
    @name = name
    @product_classification = product_classification
    @unit_selling_price = unit_selling_price
    @purchase_unit_price = purchase_unit_price
    @registration_date = registration_date
  end
end

puts Product.all
