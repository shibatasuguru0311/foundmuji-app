class MessagesController < ApplicationController
  #before_action :set_item

  def index
    @item = Item.find_by(params[:item_id])
    @message = Message.new
    @messages = @item.messages.includes(:shop)
  end

  
  def create
    @item = Item.find_by(params[:id])
    @message = @item.messages.new(message_params)
    if @message.save
      redirect_to messages_path(@item), notice: 'メッセージが送信されました'
    else
      @messages = @item.messages.includes(:shop)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end


  private

  def message_params
    params.require(:message).permit(:content).merge(shop_id: current_shop.id, )
  end

  #def set_item
    #@item = Item.find_by(id: params[:format])
  #end
end