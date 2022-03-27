class CreateCategoryBooks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :books
    remove_column :books, :category_id
  end
end
