class RemoveTableToEstoques < ActiveRecord::Migration
  def change
      drop_table :estoques
  end
end
