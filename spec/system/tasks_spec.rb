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
            click_on '新規登録'
            expect(current_path).to eq new_task_path
          end
          it 'ユーザーAが作成したタスクが表示されること' do
            expect(page).to have_content '最初のタスク'
          end
          it '編集ボタンを押下できること' do
            click_on '編集'
            expect(current_path).to eq edit_task_path(task_a)
          end
          it '削除ボタンを押下できること' do
            accept_alert do
              click_on '削除'
            end
            expect(current_path).to eq tasks_path
          end
        end
      end

      describe 'タスク登録機能' do
        let(:task_name) { '新規作成のテストを書く' }
        let(:task_description) { 'これは新規作成のテストです' }

        context 'タスクの新規登録' do
          it '正常に登録されること' do
            expect do
              visit new_task_path
              fill_in 'task_name', with: task_name
              fill_in 'task_description', with: task_description
              click_button '確認'
              click_button '登録'
              expect(page).to have_content task_name
              expect(page).to have_content task_description
            end.to change(user.tasks, :count).by(1)
          end
        end

        context 'タスクの編集' do
          it '正常に更新されること' do
            visit edit_task_path(task_a)
            fill_in 'task_name', with: '新規作成のテストを更新しました'
            fill_in 'task_description', with: 'これは新規作成のテストを更新してます'
            click_button '更新する'
            expect(page).to have_content '新規作成のテストを更新しました'
          end
        end
      end
    end
  end
end
