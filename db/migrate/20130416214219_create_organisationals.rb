class CreateOrganisationals < ActiveRecord::Migration
  def change
    create_table :organisationals do |t|
      t.integer :indicator
      t.integer :importance
      t.integer :value
      t.references :position

      t.timestamps
    end
    add_index :organisationals, :position_id
  end
end
