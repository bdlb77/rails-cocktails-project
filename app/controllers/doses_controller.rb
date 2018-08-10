class DosesController < ApplicationController
	before_action :set_cocktail, only: [:new, :create]
	def new
		@dose = Dose.new
	end

	def create
		@dose = Dose.new(doses_params)
		@dose.cocktail = @cocktail
		@dose.save
		if @dose.save 
			redirect_to cocktail_path(@cocktail)
		else
			render :new
		end
	end

	def destroy
		@cocktail = Cocktail.find(params[:id])
		@dose.destroy
		redirect_to cocktail_path(@cocktail)
	end
	
	private

	def doses_params
		params.require(:dose).permit(:description, :ingredient_id)
	end
	def set_cocktail
		@cocktail = Cocktail.find(params[:cocktail_id])
	end
end
