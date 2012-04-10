module ApplicationHelper
  def welcome_text
    str = ""
    if current_user
      str = "Welcome, #{current_user.email} | "
      str += link_to "Logout", log_out_path
      str += "<br />"
    else
      str = "#{link_to 'Login', log_in_path} | "
      str += link_to "Signup", sign_up_path
      str += "<br />"
    end
  end
end
