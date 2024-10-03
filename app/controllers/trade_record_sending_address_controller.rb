class TradeRecordSendingAddressController < ApplicationController

  def new
    @record_address = TradeRecordSendingAddress.new
  end
    
  def create
    @record_address = TradeRecordSendingAddress.new(trade_record_params)
    if @record_address.valid?
      @record_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
    
  private
    
  def trade_record_params
    params.require(:trade_record_sending_address).permit(:post_code, :prefecture_id, :sending_city, :sending_banchi, :sending_building, :sending_phone).merge(user_id: current_user.id)
  end

end