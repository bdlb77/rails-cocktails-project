class CocktailsController < ApplicationController
	before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
	def index
		@cocktails = Cocktail.all
	end

	def show
	end

	def new 
		@cocktail = Cocktail.new
	end

	def create
		@cocktail = Cocktail.new(cocktail_params)
		@cocktail.save
		if @cocktail.save
			redirect_to cocktail_path(@cocktail)
		else
			render :new
		end
	end

	def edit
	end

	def update
		@cocktail.update(cocktail_params)
		if @cocktail.save
			redirect_to cocktail_path(@cocktail)
		else
			render :edit
		end
	end

	private

	def cocktail_params
		params.require(:cocktail).permit(:name)
	end
	def set_cocktail
		@cocktail = Cocktail.find(params[:id])
	end
end
