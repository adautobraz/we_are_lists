class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :segmento
      t.string :nome_escola
    end
  end
end
