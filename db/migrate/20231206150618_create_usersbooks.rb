class CreateUsersbooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :book
    end
  end
end
