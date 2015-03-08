class CreateOrcamentos < ActiveRecord::Migration
  def change
    create_table :orcamentos do |t|

      t.timestamps
    end
  end
end
