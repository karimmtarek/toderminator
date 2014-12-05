class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  respond_to :html
  respond_to :json, only: [:edit, :update]

  def index
    @lists = current_user.lists.all
    @list = current_user.lists.new
    respond_with(@lists)
  end

  def show
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
      flash[:popover] = 'Create your first to-do item.'
      respond_with(@list)
    else
      respond_with(@list)
    end
  end

  def update
    respond_to do |format|
      @list.update(list_params)
      format.json { respond_with_bip(@list) }
    end
  end

  def destroy
    @list.destroy
    respond_with(@list)
  end

  private
    def set_list
      @list = current_user.lists.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name)
    end
end
