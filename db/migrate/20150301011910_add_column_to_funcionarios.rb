class AddColumnToFuncionarios < ActiveRecord::Migration
  def change
    add_reference :funcionarios, :cargo, index: true
  end
end
