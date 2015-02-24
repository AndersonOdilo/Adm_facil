class CreatePessoasFisicas < ActiveRecord::Migration
  def change
    create_table :pessoas_fisicas do |t|
      t.string :cpf
      t.string :rg
      t.date :data_nascimento

      t.timestamps
    end
  end
end
