class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.decimal :limite_credito

      t.timestamps
    end
  end
end
