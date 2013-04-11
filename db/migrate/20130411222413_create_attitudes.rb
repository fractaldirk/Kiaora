class CreateAttitudes < ActiveRecord::Migration
  def change
    create_table :attitudes do |t|
      t.string :description
      t.references :position

      t.timestamps
    end
    add_index :attitudes, :position_id
  end
end
