class EmploymentsController < ApplicationController

  def new
    @user = User.find(params[:id])
    Employment.create(user_id: @user.id, company: "Add Company",
                  title: "Add Title", current: false)
    redirect_to user_path(@user)
  end
end
