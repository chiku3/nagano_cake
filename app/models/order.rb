class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: {credit_card: 0, transfer: 1}

  def full_address
    "〒" + postal_code + "  " + address + "  " + name
  end
  
  def shipping_cost
    800
  end

end
