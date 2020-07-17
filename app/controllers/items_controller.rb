class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def index
  @all_ranks = Item.find(Like.group(:item_id).order('count(item_id) desc').limit(50).pluck(:item_id))
  end

  private
  def item_params
    params.require(:item).permit(:name, shop_ids: [])
  end

end
