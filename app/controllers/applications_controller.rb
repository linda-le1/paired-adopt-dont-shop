class ApplicationsController < ApplicationController

  def new
    @pets = Pet.where(id: @favorites.keys)
  end

  def create
    application = Application.new(application_params)

    if application.save
      pets = Pet.where(id: params.keys)
      application.pets << pets
      @favorites.favorite_delete(pets)
      session[:favorites] = @favorites.content
      flash[:success]= "Your application was received!"

      redirect_to '/favorites'
    else
     flash[:error]= "You have not filled out all necessary fields"
     redirect_to '/applications/new'
    end
  end

  def show
    @application = Application.find(params[:id])
  end

  private

  def application_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description)
  end
end
