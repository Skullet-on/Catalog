class CommentsController < ApplicationController

  def create
    @automobile = Automobile.find(params[:automobile_id])
    @comment = @automobile.comments.create(params[:comment].permit(:name, :body))

    redirect_to automobile_path(@automobile)
  end

  def destroy
    @automobile = Automobile.find(params[:automobile_id])
    @comment = @automobile.comments.find(params[:id])
    @comment.destroy

    redirect_to automobile_path(@automobile)
  end

end
