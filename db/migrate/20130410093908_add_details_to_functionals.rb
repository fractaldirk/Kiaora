class AddDetailsToFunctionals < ActiveRecord::Migration
  def change
    add_column :functionals, :value, :integer
    add_column :functionals, :importance, :integer
  end
end
