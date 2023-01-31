class Shop < ApplicationRecord
  has_many :slots, dependent: :destroy

  validates :name, presence: true
end
