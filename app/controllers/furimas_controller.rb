class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]

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
  
  def edit
    @furima = Furima.find(params[:id])
  end

  def update
    @furima = Furima.find(params[:id])
    @furima.update(furima_params)
    if @furima.save
      redirect_to furima_path(@furima.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def furima_params
    params.require(:furima).permit(:item_name, :explanation, :category_id, :status_id, :payer_id, :prefecture_id, :waiting_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    furima = Furima.find(params[:id])
    unless current_user.id == furima.user.id
      redirect_to action: :index
    end
  end

end