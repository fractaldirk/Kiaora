class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.integer :indicator
      t.references :position

      t.timestamps
    end
    add_index :socials, :position_id
  end
end
