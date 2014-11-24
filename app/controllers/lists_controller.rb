class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if current_user
      @lists = current_user.lists.all
      @list = current_user.lists.new
      respond_with(@lists)
    else
      @message = "you can't see this."
    end
  end

  def show
    # @todo_item = @list.todo_items.new
    respond_with(@list)
  end

  def new
    # @list = List.new
    @list = current_user.lists.new
    respond_with(@list)
  end

  def edit
  end

  def create
    # @list = List.new(list_params)
    @list = current_user.lists.new(list_params)
    if @list.save
      flash[:success] = 'To-do list successfully created.'
      redirect_to lists_path
      # respond_with(@list)
    else
      flash[:danger] = "Can't create this To-do list, please try again."
      # redirect_to :back
      respond_with(@list)
      # render :index
    end
  end

  def update
    @list.update(list_params)
    redirect_to list_todo_items_path(@list)
    # respond_with(@list)
  end

  def destroy
    @list.destroy
    respond_with(@list)
  end

  private
    def set_list
      # @list = List.find(params[:id])
      @list = current_user.lists.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name)
    end
end
