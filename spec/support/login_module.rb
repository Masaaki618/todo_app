module LoginModule
  def login(user)
    visit login_path
    fill_in 'email', with: user.email
    fill_in 'usr_password', with: 'password'
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました'
  end
end
