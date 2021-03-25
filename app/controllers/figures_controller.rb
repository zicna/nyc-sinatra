class FiguresController < ApplicationController
  # add controller methods

  
  get '/figures' do
    erb :"application/show_all"
  end

  get '/figures/new' do
    
    erb :"application/new"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"application/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])
    #binding.pry
    erb :"application/edit"
  end

  

  post '/figures' do
    #binding.pry
    @figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save
    redirect to "/figures/#{@figures.id}"
  end

  patch '/figures/:id' do
    #binding.pry
    @figure = Figure.find_by(params[:id])
    @figure.update(params[:figure])

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title][:name])
    end
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark][:name])
    end

    @figure.save
    redirect to :"figures/#{@figures.id}"
  end

end
