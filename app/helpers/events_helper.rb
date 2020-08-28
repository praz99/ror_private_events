module EventsHelper
  def session_check
    if logged_in?
      render 'helper_partials/logged_in'
    else
      render 'helper_partials/not_logged_in'
    end
  end

  def errors_check
    if @user.errors.any?
      render 'helper_partials/errors_count'
    end
  end
end
