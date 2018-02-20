class UsersController < ApplicationController
  def downgrade
    @user = current_user
    if @user.update_attribute(:role, "standard")
      @user.wikis.each do |wiki|
        wiki.update_attribute(:private, false)
      end
      flash[:alert] = "Your account has been downgraded!"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong. Please try again."
    end
  end
end