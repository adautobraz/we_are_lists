class AddCategoriaToLivro < ActiveRecord::Migration
  def change
        add_column :livros, :categoria, :string
        add_column :lists, :observacoes, :string
  end
end
