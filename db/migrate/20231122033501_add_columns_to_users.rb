class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :full_width_last_name, :string, null: false
    add_column :users, :full_width_first_name, :string, null: false
    add_column :users, :full_width_last_name_kana, :string, null: false
    add_column :users, :full_width_first_name_kana, :string, null: false
    add_column :users, :birth_date, :date, null: false
  end
end
