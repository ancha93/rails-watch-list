class BookmarksController < ApplicationController

  before_action :set_list, only: [:new, :create]


  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
   @list = List.find(params[:list_id])
   @bookmark = @list.bookmarks.build(bookmark_params)

  if @bookmark.save
    redirect_to @list, notice: 'Bookmark added successfully.'
  else
    render :new
  end
end

  def destroy
    @bookmark = bookmark.find(params[:id])
    @bookmark.destroy redirect_to bookmarks_path notice 'bookmarks delete'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id,:list_id)
  end
end
