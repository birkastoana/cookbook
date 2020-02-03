class RecipesController < ApplicationController
  layout 'standard'
  before_action :set_recipe, only: [:show, :edit, :update, :delete]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients
    @ingredients = Ingredient.all

  end


  def edit_ingredients
    redirect_to action:'new', controller: 'recipe_ingredients', recipe: @recipe
  end



  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all

  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end



  # POST /recipes
  # POST /recipes.json
  def create


    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save

        #format.html { redirect_to @recipe, notice: 'Recipe was successfully created.'}
        format.html { redirect_to action: 'new', controller: 'recipe_ingredients', recipe: @recipe}
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { redirect_to new_recipe_url, notice: 'Recipe already exists!'}
        format.json { render json: @recipe.errors, status: :unprocessable_entity}


      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.'}
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end




  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def delete
    #puts "Try to delete #{params[:id]}"
    Recipe.find(params[:id]).destroy

    #redirect_to :action => 'index'
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title, :instructions, :ok)
    end
  def recipe_ingredient_params
    params.require(:recipe).permit(:ingredient_id, :quantity, :recipe)
  end
end

