class ShopDay < ApplicationRecord
    belongs_to :shop
    belongs_to :day

    validates :shop, uniqueness: { scope: :day }
end
