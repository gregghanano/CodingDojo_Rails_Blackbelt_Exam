class AddBorrowerReferenceToHistory < ActiveRecord::Migration
  def change
  	add_reference :histories, :borrower, index:true
  end
end
