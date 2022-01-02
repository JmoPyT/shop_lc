class CreateShopDays < ActiveRecord::Migration[6.1]
    def change
        create_table :shop_days do |t|
            t.string :hours
            t.boolean :closed
            t.references :shop, null: false, foreign_key: true
            t.references :day, null: false, foreign_key: true

            t.timestamps
        end
    end
end
