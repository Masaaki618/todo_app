module LoginModule
  def login(user)
    visit login_path
    fill_in 'email', with: user.email
    fill_in 'usr_password', with: user.password
    click_button 'ログイン'
  end
end
