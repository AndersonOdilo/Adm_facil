class HerancaOrcamentoToPedidos < ActiveRecord::Migration
  def change
    change_table :pedidos do |t|
    	t.actable
    end
  end
end
