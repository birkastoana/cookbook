class RecipeIngredientsController < ApplicationController

  layout 'standard'


  def new


    @recipe = Recipe.find(params[:recipe])
    @recipe_ingredients = @recipe.recipe_ingredients.all
    @ingredients = Ingredient.all

    @recipe_id = @recipe[:id]
    puts @recipe_id

    @recipe_ingredient = RecipeIngredient.new




  end

  def create

    @recipe = Recipe.find(params[:recipe_id])
    #@recipe_ingredients = @recipe.recipe_ingredients.all
    @recipe = Recipe.find(params[:recipe_id])




    @test = recipe_ingredient_params

    @test[:recipe_id] = params[:recipe_id]
    @recipe_ingredient = RecipeIngredient.create(@test)

    if @recipe_ingredient.save


      #@recipe_ingredients = @recipe.recipe_ingredients.all
      redirect_to action: "new", recipe: @recipe
    else

      render action: "new", recipe: @recipe, notice: "Not safed!"

    end
  end

  def delete
    RecipeIngredient.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to action: 'new', recipe: params[:recipe], notice: "Ingredient deleted!"}
      format.json { head :no_content }
    end
  end



  private
  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:ingredient_id, :quantity)
  end
end
