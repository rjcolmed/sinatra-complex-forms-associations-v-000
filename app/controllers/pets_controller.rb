class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    if params[:owner][:name].empty?
      @pet = Pet.create(params[:pet])
    else
      @pet = Pet.create(params[:pet])
      @pet.owner = Owner.create(params[:owner])
      @pet.save
    end
  
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do
    @pet = Pet.find(params[:id])
    if params[:owner][:name].empty?
      @pet.update(params[:pet])
    else
      @pet.owner = Owner.create(params[:owner])
      @pet.save
    end
    redirect to "pets/#{@pet.id}"
  end
end