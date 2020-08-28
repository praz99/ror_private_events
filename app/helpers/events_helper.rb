module EventsHelper
  def session_check
    if logged_in?
      render 'helper_partials/logged_in'
    else
      render 'helper_partials/not_logged_in'
    end
  end

  def errors_check
    render 'helper_partials/errors_count' if @user.errors.any?
  end
end
