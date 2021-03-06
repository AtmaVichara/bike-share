class Order < ApplicationRecord
  validates_presence_of :user_id, :status
  has_many :order_accessories
  has_many :accessories, through: :order_accessories
  belongs_to :user

  enum status: ["Ordered", "Paid", "Completed", "Cancelled"]

  def accessory_quantity(id)
    order_accessories.find_by(accessory_id: id).quantity
  end

  def accessory_subtotal(id)
    Accessory.find(id).price * accessory_quantity(id)
  end

  def self.by_status(status)
    Order.where(status: status).count
  end
end
