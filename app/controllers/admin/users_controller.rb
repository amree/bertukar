class Admin::UsersController < ApplicationController
  # GET /admin/jobs
  def index
    @users = User.all
  end

  # GET /admin/jobs/1
  def show
    @user = User.find(params[:id])
  end

  # DELETE /admin/jobs/1
  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to admin_users_url, notice: "#{@user.email} deleted."
    else
      redirect_to [:admin, @user], alert: @user.errors.full_messages.first
    end
  end
end
