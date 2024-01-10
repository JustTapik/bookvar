class AddBookIdAndUserIdToUsersBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :usersbooks, :user_id, :integer
    add_column :usersbooks, :book_id, :integer
    add_foreign_key :usersbooks, :users, column: :user_id
    add_foreign_key :usersbooks, :books, column: :book_id
  end
end
