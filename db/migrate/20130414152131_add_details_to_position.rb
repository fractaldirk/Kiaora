class AddDetailsToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :office, :integer
    add_column :positions, :scope, :text
  end
end
