class AddSPositionToSocials < ActiveRecord::Migration
  def change
    add_column :socials, :s_position, :integer
  end
end
