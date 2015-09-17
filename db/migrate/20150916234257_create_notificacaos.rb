class CreateNotificacaos < ActiveRecord::Migration
  def change
    create_table :notificacaos do |t|
      t.references :produto, index: true
      t.boolean :visualizado

      t.timestamps
    end
  end
end
