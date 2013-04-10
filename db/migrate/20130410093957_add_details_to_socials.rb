class AddDetailsToSocials < ActiveRecord::Migration
  def change
    add_column :socials, :value, :integer
    add_column :socials, :importance, :integer
  end
end
