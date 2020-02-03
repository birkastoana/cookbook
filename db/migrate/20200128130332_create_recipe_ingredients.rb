class CreateRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredients do |t|
      t.belongs_to :ingredient
      t.belongs_to :recipe
      t.integer :quantity
      t.timestamps
    end

    add_reference :recipes, :recipe_ingredients, foreign_key: false, index: false

  end
end
