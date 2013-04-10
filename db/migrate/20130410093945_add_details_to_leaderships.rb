class AddDetailsToLeaderships < ActiveRecord::Migration
  def change
    add_column :leaderships, :value, :integer
    add_column :leaderships, :importance, :integer
  end
end
