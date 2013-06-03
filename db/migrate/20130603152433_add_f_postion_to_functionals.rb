class AddFPostionToFunctionals < ActiveRecord::Migration
  def change
    add_column :functionals, :f_position, :integer
  end
end
