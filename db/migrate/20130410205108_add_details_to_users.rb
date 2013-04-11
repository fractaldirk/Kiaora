class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :office, :integer
    add_column :users, :language, :integer
    add_column :users, :role, :integer
  end
end
