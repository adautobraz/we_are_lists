class AddSerieToLists < ActiveRecord::Migration
  def change
    add_column :lists, :serie, :string
  end
end
