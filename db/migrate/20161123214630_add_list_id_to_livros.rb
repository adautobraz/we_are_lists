class AddListIdToLivros < ActiveRecord::Migration
  def change
    add_column :livros, :list_id, :integer
  end
end
