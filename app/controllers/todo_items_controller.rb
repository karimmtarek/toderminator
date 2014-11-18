class TodoItemsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @todo_item = @list.todo_items.create(todo_item_params)

    redirect_to list_path(@list)
  end

  def destroy
    # @list = List.find(params[:list_id])
    @todo_item = TodoItem.find(params[:id])

    @todo_item.destroy
  end

  private

  def todo_item_params
    params.require(:todo_item).permit(:name)
  end
end
