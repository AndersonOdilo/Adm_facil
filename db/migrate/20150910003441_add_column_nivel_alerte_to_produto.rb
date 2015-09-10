class AddColumnNivelAlerteToProduto < ActiveRecord::Migration
  def change
    add_column :produtos, :nivel_alerta, :integer
  end
end
