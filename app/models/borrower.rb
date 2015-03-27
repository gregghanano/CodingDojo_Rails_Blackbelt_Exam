class Borrower < ActiveRecord::Base
	has_many :histories
	has_many :lenders, :through => :histories

	validates :first_name, :last_name, :email, :password, :purpose, :description, :money, presence: true

	def has_password?(submitted_password)
	  self.password == submitted_password
	end

	def self.authenticate(email, submitted_password)
	  user = find_by_email(email)
	  return nil if user.nil?
	  return user if user.has_password?(submitted_password)
	end
end
