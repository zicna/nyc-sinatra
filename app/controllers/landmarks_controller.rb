class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do 
  @landmarks = Landmark.all

    erb :"landmarks/index"
  end

  get '/landmarks/new' do

    erb :"landmarks/new"
  end


  get '/landmarks/:id' do
    #binding.pry
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  get '/landmarks/:id/edit' do
    #binding.pry
    @landmark = Landmark.find_by(params[:id])

    erb :"landmarks/edit"
  end


  post '/landmarks' do
    #binding.pry
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])

    redirect to "/landmarks"
  end

  post '/landmarks/:id' do
    #binding.pry
    @landmark = Landmark.find(params[:id])
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end
end
