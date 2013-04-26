class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :request
      t.string :user
      t.integer :office
      t.integer :status

      t.timestamps
    end
  end
end
