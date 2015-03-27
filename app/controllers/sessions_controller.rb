class SessionsController < ApplicationController
  def new
  end

  def create
  	user = Lender.authenticate(params[:email], params[:password])
  	if user.nil?
  		user = Borrower.authenticate(params[:email], params[:password])
  		if user.nil?
  			flash[:error] = "Couldn't find a user with that email and password"
  			redirect_to '/users/index'
  		else
  			session[:user_id] = user.id
  			redirect_to '/borrowers'
  		end
  	else
  		session[:user_id] = user.id
  		redirect_to '/lenders'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/users/index'
  end
end
