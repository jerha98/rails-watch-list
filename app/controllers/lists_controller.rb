class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      redirect_to root_path, notice: 'List was successfully deleted.'
    else
      redirect_to list_path(@list), alert: 'List could not be deleted.'
    end
  end

    private

  def list_params
    params.require(:list).permit(:name)
  end
end
