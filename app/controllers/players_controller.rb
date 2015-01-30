class PlayersController < ApplicationController

  def object_params
    params.require(:player).permit(:name)
  end
  def index
    players = Player.all
    render json: players
  end
  def create
    player = Player.create(object_params)
    head :created
  end
  def destroy
    player = Player[params[:id]]
    player && player.destroy
    head :ok
  end
end
