class AddPdfDetailsToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :salary_range, :string
    add_column :positions, :salary_range_cb, :boolean
    add_column :positions, :job_grade_cb, :boolean
    add_column :positions, :valid_from_cb, :boolean
    add_column :positions, :reports_to_cb, :boolean
    add_column :positions, :line_manages_cb, :boolean
    add_column :positions, :fte, :decimal
    add_column :positions, :fte_cb, :boolean
    add_column :positions, :permanent, :integer
    add_column :positions, :permanent_cb, :boolean
  end
end
