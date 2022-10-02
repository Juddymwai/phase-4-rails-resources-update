class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  def update 
    birds = Bird.find_by(id: params(:id))

    if birds
      birds.update(bird_params)
      render json: birds
    else
      render json: {error:"bird not found"}, status: :not_found
    end
  end

  def increment_likes 
    birds = Bird.find_by(id: params(:id))
    if birds 
      birds.update(likes: birds.likes + 1)
    render json: birds
  end

  private

  def bird_params
    params.permit(:name, :species)
  end

end
