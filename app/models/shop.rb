class Shop < ApplicationRecord
    has_many :shop_days, dependent: :destroy
    has_many :days, through: :shop_days
    validates :name, presence: true, uniqueness: true

    accepts_nested_attributes_for :shop_days, reject_if: proc { |attributes| attributes['day_id'].blank? }
end
