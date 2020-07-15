class LikesController < ApplicationController

  before_action :item_params
  def create
      like = current_shop.likes.new(item_id: @item.id)
      like.save
  end

  def destroy
    @like = Like.find_by(shop_id: current_shop.id, item_id: @item.id).destroy
  end

  private
  def item_params
    @item = Item.find(params[:item_id])
  end

end
