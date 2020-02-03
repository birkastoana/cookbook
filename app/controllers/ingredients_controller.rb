class IngredientsController < ApplicationController
  layout 'standard'

  before_action :set_ingredient, only: [:show, :edit, :update, :delete]

  def index
    @ingredients = Ingredient.all
    #render file: "#{Rails.root}/app/views/ingredients/index.html.erb"
    # render "recipes/index"
  end


  def show
    @ingredient = Ingredient.find(params[:id])
  end


  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    #puts @ingredient

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredients_path, notice: 'Ingredient successfully created!'}
        format.json { render :index, status: :created, location: @ingredients }
      else
        format.html { redirect_to new_ingredient_url, notice: 'Ingredient already exists!'}
        format.json { render json: @ingredient.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if Ingredient.find(params[:id]).update(ingredient_params)
        format.html {redirect_to ingredients_path, notice: "Ingredient successfully updated!"}
        format.json { render :show, status: :ok, location: @ingredient}
      else
        format.html { render :edit}
        format.json { render json: @ingredient.errors, status: :unprocessable_entity}
      end
    end
  end

  def delete
    Ingredient.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to ingredients_path, notice: 'Ingredient successfully deleted!'}
      format.json { head :no_content }
    end
  end


  private
  def ingredient_params
    params.require(:ingredient).permit(:name, :weight)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end


end
