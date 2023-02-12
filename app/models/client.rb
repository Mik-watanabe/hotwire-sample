class Client < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "name", "tel"]
    end
end
