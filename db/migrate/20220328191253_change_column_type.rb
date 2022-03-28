class ChangeColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :title, :string
    change_column :authors, :first_name, :string
    change_column :authors, :last_name, :string
    change_column :categories, :name, :string
  end
end
