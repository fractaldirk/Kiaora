class AddMoreDetailsToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :valid_from, :date
    add_column :positions, :job_grade, :string
    add_column :positions, :reports_to, :string
    add_column :positions, :line_manages, :string
    add_column :positions, :purpose, :text
    add_column :positions, :draft, :integer
    add_column :positions, :user_name, :string
  end
end
