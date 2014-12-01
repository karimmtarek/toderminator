class TodoItemsController < ApplicationController
  respond_to :html, :js, :json
  before_action :authenticate_user!, :set_list

  def new
    @todo_item = TodoItem.new
  end

  def create
    @todo_item = TodoItem.new todo_item_params.merge(list:@list)
    @new_todo_item = TodoItem.new

    if @todo_item.save
      # redirect_to list_todo_items_path(@list)
      flash[:success] = "Item was created successfully."
    else
      flash[:warning] = "Error while trying to create an item, please try again."
      # render :index
    end

    respond_with(@todo_item) do |format|
      format.html { redirect_to list_todo_items_path(@list) }
    end
  end

  def edit
    @todo_item = @list.todo_items.find(params[:id])
  end

  def update
    @todo_item = @list.todo_items.find(params[:id])

    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.json { respond_with_bip(@todo_item) }
      else
        format.json { respond_with_bip(@todo_item) }
      end
    end

    # respond_with @todo_item
  end

  def destroy
    @todo_item = TodoItem.find(params[:id])

    if @todo_item.destroy
      flash[:success] = "Item was successfully removed."
    else
      flash[:danger] = "Item couldn't be removed. Try again."
    end

    # redirect_to list_todo_items_path(@list)
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
