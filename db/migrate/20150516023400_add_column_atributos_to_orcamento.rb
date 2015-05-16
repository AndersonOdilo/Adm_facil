class AddColumnAtributosToOrcamento < ActiveRecord::Migration
  def change
    add_column :orcamentos, :data, :date
    add_column :orcamentos, :data_validade, :date
    add_column :orcamentos, :obs, :string
  end
end
