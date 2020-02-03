class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates_length_of :title, :within => 1..20
  validates_uniqueness_of :title, notice: "already exists"
  validates :ok, acceptance: {message: 'check this before check'}
  before_validation do
    puts :ok
  end

  private

end

