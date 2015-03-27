class LendersController < ApplicationController

  def create
  	@lender = Lender.new(lender_params)
  	@lender.save
  	if @lender.save
  		redirect_to '/users/index'
  	else
  		flash[:errors] = @lender.errors.full_messages
  		redirect_to '/users/add'
  	end
  end

  def show
  	@lender = Lender.find(session[:user_id])
  	# @borrowers = Borrower.group(:first_name)
  	@transactions = Borrower.select('borrowers.*, histories.amount as amount, histories.borrower_id as histories_borrower_id, histories.lender_id as lender_id').joins(:histories).group(:first_name)
  	render '/lenders/show'
  end

  def destroy
  end

  private
  def lender_params
  	params.require(:lender).permit(:first_name, :last_name, :email, :password, :money)
  end
end
