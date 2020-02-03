class Ingredient < ApplicationRecord
  #has_many :recipe_ingredients
  #has_many :recipes, through: :recipe_ingredients
  validates_length_of :name, :within => 1..32
  validates_uniqueness_of :name, notice: "already exists"
end
