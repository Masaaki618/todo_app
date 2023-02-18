require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  describe 'User機能' do
    describe 'ユーザー登録' do
      before do
        visit sign_up_path
      end

      context 'フォームの入力値が正常' do
        it 'ユーザーの新規作成が成功すること' do
          fill_in 'user_name', with: 'テストユーザー'
          fill_in 'user_email', with: 'test@example.com'
          fill_in 'password', with: 'password'
          fill_in 'user_password_confirmation', with: 'password'
          click_button '登録する'
          expect(current_path).to eq root_path
        end
      end

      context 'メールアドレスの未入力' do
        it 'ユーザーの新規作成が失敗すること' do
          fill_in 'user_name', with: 'テストユーザー'
          fill_in 'user_email', with: nil
          fill_in 'password', with: 'password'
          fill_in 'user_password_confirmation', with: 'password'
          click_button '登録する'
          expect(current_path).to eq sign_up_path
        end
      end
    end

    describe 'ログイン後' do
      let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }

      before do
        login(user)
      end

      context 'ユーザーAがログインしているとき' do
        let(:user) { user_a }

        it 'ログイン状態であること' do
          expect(page).to have_content 'ログインしました'
          expect(current_path).to eq root_path
        end
        it 'ログアウトが成功すること' do
          expect(page).to have_content 'ログインしました'
          expect(page).to have_content 'ログアウト'
        end
      end
    end
  end
end
