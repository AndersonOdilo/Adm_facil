class AddColumnNumeroParcelaToPagamentosVendas < ActiveRecord::Migration
  def change
    add_column :pagamentos_vendas, :numero_parcela, :integer
  end
end
