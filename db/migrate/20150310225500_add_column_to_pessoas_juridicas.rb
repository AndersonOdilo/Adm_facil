class AddColumnToPessoasJuridicas < ActiveRecord::Migration
  def change
    add_column :pessoas_juridicas, :data_abertura, :date
  end
end
