class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name, :limit => 32, :null => false
      t.string :weight, :limit => 6, :null => false

      t.timestamps
    end
  end
end
