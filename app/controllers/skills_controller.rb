class SkillsController < ApplicationController

  def new
    @user = User.find(params[:id])
    Skill.create(user_id: @user.id, name: "Add Skill")
    redirect_to user_path(@user)
  end
end
