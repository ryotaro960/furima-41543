class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @furimas = Furima.includes(:user).order("created_at DESC")
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.new(furima_params)
    if @furima.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @furima = Furima.find(params[:id])
  end
  
  private

  def furima_params
    params.require(:furima).permit(:item_name, :explanation, :category_id, :status_id, :payer_id, :prefecture_id, :waiting_id, :price, :image).merge(user_id: current_user.id)
  end

end