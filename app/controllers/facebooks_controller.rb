
class FacebooksController < ApplicationController
  def index
    auth = FbGraph::Auth.new("425361747497382", "7b7523dd9b476aacb796d549154f4d96")
    
    auth.from_cookie(cookies) # Put whole cookie object (a Hash) here.    
    user = FbGraph::User.me(auth.access_token)
    user = user.fetch
    @user =  user
    @comment = Comment.new
    @comments = Comment.find(:all, :order => "id DESC")    
    @fb = Facebook.count(:all, :conditions => {:email => @user.email})
    if @fb == 0
      redirect_to new_facebook_path
    else
      if session[:user]==0
        ses = Facebook.where(:email => @user.email)      
        ses.each do |s|
        session[:user]=s.id
        end
      end
    end 
   end
   
   def new
    auth = FbGraph::Auth.new("247969818637768", "178adf2834c1fc3b0aaa5e6e65bf7432")
    auth.from_cookie(cookies) # Put whole cookie object (a Hash) here.    
    user = FbGraph::User.me(auth.access_token)
    user = user.fetch
    @user =  user
    @new_user = Facebook.new(:email => @user.email, :fbid => @user.identifier, :nombre => @user.name )
    if @new_user.save
      redirect_to facebooks_path, :notice => "Nuevo Usuario Creado"
    else
      redirect_to facebooks_path, :notice => "Error"
    end    
     
   end
end
