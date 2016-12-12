class AddEscolaIdToLists < ActiveRecord::Migration
  def change
    add_column :lists, :escola_id, :integer
  end
end
