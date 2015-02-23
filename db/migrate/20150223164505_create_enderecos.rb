class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :numero
      t.string :complemento
      t.references :rua, index: true

      t.timestamps
    end
  end
end
