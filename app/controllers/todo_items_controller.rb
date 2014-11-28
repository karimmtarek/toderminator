class TodoItemsController < ApplicationController
  before_action :authenticate_user!, :set_list

  def new
    @todo_item = @list.todo_items.new
  end

  def create
    @todo_item = TodoItem.new todo_item_params.merge(list:@list)

    if @todo_item.save
      redirect_to list_todo_items_path(@list)
    else
      flash[:warning] = "Error while trying to create an item, please try again."
      # redirect_to :back
      render :index
    end
  end

  def edit
    @todo_item = @list.todo_items.find(params[:id])
  end

  def update
    @todo_item = @list.todo_items.find(params[:id]).update(todo_item_params)
    redirect_to list_path(@list)
  end

  def destroy
    @todo_item = TodoItem.find(params[:id])
    @todo_item.destroy

    redirect_to list_todo_items_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def todo_item_params
    params.require(:todo_item).permit(:name, :days_left, :delete_on)
  end
end
