class ItemBringsController < ApplicationController

  def create_brings
    item_brings = params[:item_brings] # how does it know what to get

    item_brings.each do |item_bring|

      # item stores the item id
      item = Item.find(item_bring.first)

      @item_bring = ItemBring.create(item: item, user: current_user, event: item.event, quantity: item_bring.last)
    end

    item = Item.find(params[:item_brings].keys.first)
    redirect_to event_items_path(item.event), notice: "You're items are now packed!"

  end
end
