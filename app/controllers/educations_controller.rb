class EducationsController < ApplicationController

  def new
    @user = User.find(params[:id])
    Education.create(user_id: @user.id, field_of_study: "Add Field of Study",
                  degree: "N/A", school: "Add School", degree_date: 2015)
    redirect_to user_path(@user)
  end
end
