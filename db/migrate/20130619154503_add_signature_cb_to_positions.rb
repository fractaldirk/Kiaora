class AddSignatureCbToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :signature_cb, :integer
  end
end
