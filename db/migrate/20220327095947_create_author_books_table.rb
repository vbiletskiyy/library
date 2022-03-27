class CreateAuthorBooksTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :authors, :books
  end
end
