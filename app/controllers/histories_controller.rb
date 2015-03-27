class HistoriesController < ApplicationController
  def transact
  	@transaction = History.new(amount: params[:amount], lender_id: session[:user_id], borrower_id: params[:id])
  	@transaction.save
  	if @transaction.save
  		@lender = Lender.find(session[:user_id])
  		@lender_money = @lender.money - @transaction.amount
  		Lender.find(session[:user_id]).update(money:@lender_money)
  		@borrower = Borrower.find(params[:id])
  		@borrower_money = @borrower.raised + @transaction.amount
  		Borrower.find(params[:id]).update(raised:@borrower_money)
  		redirect_to '/lenders/show'
  	else
  		flash[:error] == "You have an error!"
  	end
  end
end
