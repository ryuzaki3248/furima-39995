class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :product_name        , null: false
      t.text       :product_description         , null: false
      t.integer    :category_id     , null: false
      t.integer    :product_condition_id     , null: false
      t.integer    :burden_of_shipping_charges_id     , null: false
      t.integer    :prefecture_id     , null: false
      t.integer    :number_of_days_until_shipping_id     , null: false            
      t.integer    :selling_price     , null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
