class RemoveLogradouroFromEscola < ActiveRecord::Migration
  def change
    remove_column :escolas, :logradouro, :string
    remove_column :escolas, :numero, :string
    remove_column :escolas, :complemento, :string
    remove_column :lists, :nome_escola, :string
    remove_column :escolas, :ddd, :string
  end
end
