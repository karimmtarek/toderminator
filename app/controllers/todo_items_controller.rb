class TodoItemsController < ApplicationController
  respond_to :html
  respond_to :js, only: [:new, :create, :destroy]
  respond_to :json, only: [:edit, :update]

  before_action :authenticate_user!, :set_list

  def new
    @todo_item = TodoItem.new
  end

  def create
    @todo_item = TodoItem.new todo_item_params.merge(list:@list)
    @new_todo_item = TodoItem.new
    @todo_item.save

    respond_with(@todo_item) do |format|
      format.html { redirect_to list_todo_items_path(@list) }
    end
  end

  def edit
    @todo_item = @list.todo_items.find(params[:id])
  end

  def update
    @todo_item = @list.todo_items.find(params[:id])
    @todo_item.update(todo_item_params)

    respond_to do |format|
      format.json { respond_with_bip(@todo_item) }
    end
  end

  def destroy
    @todo_item = TodoItem.find(params[:id])
    @todo_item.destroy

    respond_with(@todo_item) do |format|
      format.html { redirect_to list_todo_items_path(@list) }
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def todo_item_params
    params.require(:todo_item).permit(:name, :days_left, :delete_on)
  end
end
