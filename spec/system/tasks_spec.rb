require 'rails_helper'

RSpec.describe 'Tasks', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let!(:task_a) { FactoryBot.create(:task, name: '最初のタスク', user: user_a) }

  before do
    login(user)
  end

  describe 'Taskleaf' do
    describe 'ログイン後' do
      let(:user) { user_a }

      describe 'タスク管理機能' do
        context 'タスク一覧' do
          it '新規登録ボタンを押下できること' do
            expect(page).to have_content 'ログインしました'
            click_on '新規登録'
          end
          it 'ユーザーAが作成したタスクが表示されること' do
            expect(page).to have_content 'ログインしました'
            expect(page).to have_content '最初のタスク'
          end
          it '編集ボタンを押下できること' do
            expect(page). to have_content 'ログインしました'
            click_on '編集'
          end
          it '削除ボタンを押下できること' do
            expect(page). to have_content 'ログインしました'
            click_on '削除'
          end
        end
      end
    end
  end
end
