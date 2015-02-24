class AddColumnToEmails < ActiveRecord::Migration
  def change
    add_reference :emails, :pessoa, index: true
  end
end
