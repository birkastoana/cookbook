class AddOkToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :ok, :boolean
  end
end
