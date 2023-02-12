class Client < ApplicationRecord
  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at name tel]
  end
  validates :name, presence: true
  validates :tel, presence: true
end
