
class CommentsController < ApplicationController
  
  def new
    
  end
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.facebook_id = session[:user]
    if @comment.save
      redirect_to facebooks_path, :notice => "Posted"
    else
       redirect_to facebooks_path, :notice => "NOTPOSTED"
    end
  end
  
end
