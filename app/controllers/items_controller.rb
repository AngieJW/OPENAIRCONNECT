class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = policy_scope(Item)
    @event = Event.find(params[:event_id])
  end

  def new
    @event = Event.find(params[:event_id])
    @item = Item.new
  end

  def create
    @event = Event.find(params[:event_id])
    @items = []

    params[:item].each do |item_param|
      item = Item.new(name: item_param['name'], quantity: item_param['quantity'])
      item.event = @event
      @items << item
    end

    if @items.all?(&:save)
      redirect_to event_path(@event)
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
