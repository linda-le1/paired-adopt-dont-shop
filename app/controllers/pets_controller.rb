class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def list_by_shelter
    @shelter = Shelter.find(params[:id])
    @pets = @shelter.pets.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    pet = shelter.pets.create(pet_params)
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
      Pet.destroy(params[:id])
      redirect_to '/pets'
  end

  def set_favorite_status
    pet = Pet.find(params[:id])
    if pet.favorite_status == false
      pet.update(favorite_status: true)
      # flash.now[:success] = "You added a new pet to your favorites!"
    else
      flash.now[:error] = "You have already favorited this pet!"
    end
    redirect_to "/pets/#{pet.id}"
  end

  private
    def pet_params
      params.permit(:image_url, :name, :approximate_age, :description, :sex)
    end

end
