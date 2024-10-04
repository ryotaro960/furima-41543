class TradeRecordSendingAddressController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_furima, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @trade_record_sending_address = TradeRecordSendingAddress.new
  end
    
  def create
    @trade_record_sending_address = TradeRecordSendingAddress.new(trade_record_params)
    if @trade_record_sending_address.valid?
      @trade_record_sending_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
  
  private

  def move_to_index
    if current_user.id == @furima.user.id
      redirect_to '/furimas'
    end
  end

  def set_furima
    @furima = Furima.find(params[:furima_id])
  end

  def trade_record_params
    params.require(:trade_record_sending_address).permit(:post_code, :prefecture_id, :sending_city, :sending_banchi, :sending_building, :sending_phone).merge(furima_id: @furima.id, user_id: current_user.id)
  end

end