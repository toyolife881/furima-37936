class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,                  null: false
      t.text       :item_explanation,           null: false
      t.integer    :item_category_id,           null: false
      t.integer    :item_status_id,             null: false
      t.integer    :burden_of_charge_id,        null: false
      t.integer    :delivery_prefecture_id,     null: false
      t.integer    :delivery_days_id,           null: false
      t.integer    :price,                      null: false
      t.references :user,                       null: false, foreign_key: true

      t.timestamps
    end
  end
end
