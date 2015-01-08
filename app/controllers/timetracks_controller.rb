class TimetracksController < ApplicationController

  def index
    @timetracks = Timetrack.all
  end

  def login
    if current_user.timetracks.where("created_at >= ?", Time.now.beginning_of_day).present?
      flash[:notice] = "You have been already login for today."
      redirect_to companies_path
    else
      @timetrack = current_user.timetracks.new
      @timetrack.login_time = Time.now
      @timetrack.save
      redirect_to companies_path
      flash[:notice] = "Wish you a great day. Thank you for your login."
    end
  end

  def logout
    if current_user.timetracks.where("login_time >= ?", Time.now.beginning_of_day).present?
      if current_user.timetracks.where("logout_time >= ?", Time.now.beginning_of_day).present?
        flash[:notice] = "You have been already logout for today."
        redirect_to companies_path
      else
        @timetrack = current_user.timetracks.sort_by{|t| t.id}.last
        @timetrack.logout_time = Time.now
        @timetrack.save
        redirect_to companies_path
        flash[:notice] = "Good-Bye"
      end
    else
      flash[:notice] = "You have not login yet. Please login first."
      redirect_to companies_path
    end
  end
end
