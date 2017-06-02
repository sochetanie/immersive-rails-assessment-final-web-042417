class GuestsController < ApplicationController

  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def create
    @guest = Guest.create(guest_params)
    redirect_to guest_path(@guest)
   end

private

    def guest_params
        params.require(:guest).permit(:name, :occupation)
    end

end
