def login_as(user)
  visit log_in_path
  fill_in 'session_email', with: user.email
  fill_in 'session_password', with: 'password'
  click_button I18n.t('sessions.new.submit')
end