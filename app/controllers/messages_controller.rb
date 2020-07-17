class MessagesController < ApplicationController
  before_action :set_item

  def index
    #@item = Item.find(params[:item_id])
    @message = Message.new
    @messages = @item.messages.includes(:shop)
  end

  
  def create
    #@item = Item.find(params[:item_id])
    @message = @item.messages.new(message_params)
    if @message.save
      respond_to do |format|
        ##format.html { redirect_to item_messages_path }
        format.json
      end
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

  def set_item
    @item = Item.find(params[:item_id])
  end
end

