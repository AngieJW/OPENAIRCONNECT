class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.event = @event
    if @item.save!
      redirect_to items_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to items_path, status: :see_other
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :quantity)
  end

end
