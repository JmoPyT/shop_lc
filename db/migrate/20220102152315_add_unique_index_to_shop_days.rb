class AddUniqueIndexToShopDays < ActiveRecord::Migration[6.1]
    def change
        add_index :shop_days, [:shop_id, :day_id], unique: true
    end
end
