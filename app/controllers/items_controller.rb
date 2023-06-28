class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = policy_scope(Item)
    @event = Event.find(params[:event_id])
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

  def update_all
    item_ids = params[:item_ids] # how does it know what to get
    packed = params[:packed] # what is stored in packed ?

    item_ids.each_with_index do |item_id, index|
      item = Item.find(item_id)
      item.update(packed: packed[index])
    end

    redirect_to items_path, notice: "You're items are now packed!"

    # @item.packed = true
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
