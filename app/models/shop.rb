class Shop < ApplicationRecord
  has_many :slots, dependent: :destroy
  has_many :holidays, dependent: :destroy

  validates :name, presence: true
end
