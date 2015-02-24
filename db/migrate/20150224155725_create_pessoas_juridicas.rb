class CreatePessoasJuridicas < ActiveRecord::Migration
  def change
    create_table :pessoas_juridicas do |t|
      t.string :nome_fantasia
      t.string :cnpj
      t.string :inscricao_estadual

      t.timestamps
    end
  end
end
