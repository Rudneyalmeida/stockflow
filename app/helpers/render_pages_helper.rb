module RenderPagesHelper
  def hide_navbar?
    current_page?(new_user_session_path) || current_page?(new_user_registration_path) || current_page?(new_user_password_path) || current_page?(edit_user_password_path) || current_page?(cancel_user_registration_path) || current_page?(edit_user_registration_path) || current_page?(landpage_path)
  end
end
