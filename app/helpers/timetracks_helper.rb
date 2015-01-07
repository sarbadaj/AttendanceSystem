module TimetracksHelper
  def total_duration(timetrack)
    if timetrack.logout_time.present?
      timetrack.duration = timetrack.logout_time - timetrack.login_time
    end
  end
end
