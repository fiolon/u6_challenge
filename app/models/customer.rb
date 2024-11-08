class Customer < ApplicationRecord
  has_one_attached :image
  validates :full_name, :email, presence: true
  validates :email, uniqueness: true
  validates :phone_number, presence: true, length: { maximum: 12 }
  validates :notes, length: { maximum: 500 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "full_name", "id", "notes", "phone_number", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end
end
