class FurimasController < ApplicationController
  
  before_action :move_to_index, except: :index
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def index
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

  private

  def furima_params
    params.require(:furima).permit(:item_name, :explanation, :category_id, :status_id, :payer_id, :prefecture_id, :waiting_id, :price, :image).merge(user_id: current_user.id)
  end

end