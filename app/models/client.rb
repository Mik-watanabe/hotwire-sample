class Client < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "name", "tel"]
  end
  validates :name, presence: true
  validates :tel, presence: true
end
