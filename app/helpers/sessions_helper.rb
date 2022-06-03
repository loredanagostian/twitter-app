module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end

  def current_user #utilizatorul care e logat in sistem in acest moment
    if session[:user_id].present?
      User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    current_user.present?
  end

  def current_user?(user)
    current_user == user
  end

  def current_post
    if session[:post_id].present?
      Post.find(session[:post_id])
    end
  end
end
