class TradeRecordSendingAddressController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_furima, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @trade_record_sending_address = TradeRecordSendingAddress.new
  end
    
  def create
    @trade_record_sending_address = TradeRecordSendingAddress.new(trade_record_params)
    if @trade_record_sending_address.valid?
      pay_item
      @trade_record_sending_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end
  
  private

  def set_furima
    @furima = Furima.find(params[:furima_id])
  end

  def move_to_index
    if current_user.id == @furima.user.id || TradeRecord.where(furima_id: @furima.id) != []
      redirect_to '/furimas'
    end
  end

  def trade_record_params
    params.require(:trade_record_sending_address).permit(:post_code, :prefecture_id, :sending_city, :sending_banchi, :sending_building, :sending_phone).merge(furima_id: @furima.id, user_id: current_user.id, token: params[:token])
  end

  def  pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @furima[:price],
      card: trade_record_params[:token],
      currency: 'jpy'
    )
  end
end