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
    @timetrack = current_user.timetracks.sort_by{|t| t.id}.last
    @timetrack.logout_time = Time.now
    @timetrack.save
    redirect_to companies_path
  end
end
