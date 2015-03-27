class BorrowersController < ApplicationController

  def create
  	@borrower = Borrower.new(borrower_params)
  	@borrower.save
  	if @borrower.save
  		redirect_to '/users/index'
  	else
  		flash[:borrowerErrors] = @borrower.errors.full_messages
  		redirect_to '/users/add'
  	end
  end

  def show
  	@borrower = Borrower.find(session[:user_id])
  	@transactions = History.select('histories.*, lenders.first_name as lender_first_name, lenders.last_name as lender_last_name, lenders.email as lender_email').joins(:lender)
  	render '/borrowers/show'
  end

  def destroy
  end

  private
  def borrower_params
  	params.require(:borrower).permit(:first_name, :last_name, :email, :password, :purpose, :description, :money)
  end
end
