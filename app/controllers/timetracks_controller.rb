class TimetracksController < ApplicationController

  def index
    @timetracks = Timetrack.all
  end

  def login
    @timetrack = current_user.timetracks.new
    @timetrack.login_time = Time.now
    @timetrack.save
    redirect_to companies_path
  end

  def logout
    @timetrack = current_user.timetracks.sort_by{|t| t.id}.last
    @timetrack.logout_time = Time.now
    @timetrack.save
    redirect_to companies_path
  end
end
