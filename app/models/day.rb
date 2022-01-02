class Day < ApplicationRecord
    has_many :shop_days
    has_many :shops, through: :shop_days
    validates :label, presence: true, uniqueness: true
end
