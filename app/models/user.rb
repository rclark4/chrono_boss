class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :admin
  # has_many :furloughs, :through => :employees # THIS MAY NOT WORK

  # def if_admin(user) # we'll try it out
  #   if(user.is_admin? && block_given?)
  #     yield
  #     return
  #   end
  # end

	#   <% if_admin(@user) do %>
	# <% end %>
end
