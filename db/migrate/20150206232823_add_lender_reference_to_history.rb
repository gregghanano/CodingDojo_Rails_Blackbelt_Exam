class AddLenderReferenceToHistory < ActiveRecord::Migration
  def change
  	add_reference :histories, :lender, index:true
  end
end
