class PlayersController < ApplicationController

  def object_params
    params.require(:player).permit(:name, :at)
  end
  def index
    at = Date.parse(params[:at])
    players = Player.filter(at: at)
    render json: players
  end
  def create
    player = Player.create(object_params)
    render json: player, status: :created
  end
  def destroy
    player = Player[params[:id]]
    player && player.destroy
    head :ok
  end
end
