class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :user_name
      t.string :content
      t.string :link
      t.string :action
      t.integer :office

      t.timestamps
    end
  end
end
