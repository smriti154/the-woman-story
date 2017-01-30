class DomainsController < ApplicationController
 def create
 	puts "...................", params
 	@domain = Domain.new(domain_params)
      respond_to do |format|
         if @domain.save
            format.html { redirect_to home_path, notice: 'Domain was successfully created.' }
            # format.json { render :show, status: :created, location: @recipe }
         else
            format.html { render :new }
            # format.json { render json: @recipe.errors, status: :unprocessable_entity }
         end
      end
 end

 def new
 	
 end

 def home
   @domains = Domain.all
 end

 private
   def domain_params
      params.permit(:name, :photo)
   end
end
