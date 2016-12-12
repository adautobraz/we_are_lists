class CreateLivros < ActiveRecord::Migration
  def change
    create_table :livros do |t|
      t.bigint :isbn
      t.string :selo
      t.string :edicao
      t.string :volume_serie
      t.string :disciplina
      t.string :segmento
      t.string :colecao
      t.string :obra
      t.string :autor
    end
  end
end
