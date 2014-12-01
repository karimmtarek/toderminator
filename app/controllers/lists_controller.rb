class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @lists = current_user.lists.all
    @list = current_user.lists.new
    respond_with(@lists)
  end

  def show
    # respond_with(@list)
    redirect_to list_todo_items_path(@list)
  end

  def new
    @list = current_user.lists.new
    respond_with(@list)
  end

  def edit
  end

  def create
    @list = List.new list_params.merge(user: current_user)
    if @list.save
      flash[:success] = 'To-do list successfully created.'
      # redirect_to lists_path
      respond_with(@list)
    else
      flash[:danger] = "Can't create this To-do list, please try again."
      respond_with(@list)
    end
  end

  def update

    # redirect_to list_todo_items_path(@list)

    respond_to do |format|
      if @list.update(list_params)
        format.json { respond_with_bip(@list) }
      else
        format.json { respond_with_bip(@list) }
      end
    end
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
