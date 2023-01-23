require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { build(:task) }
  let(:create_task) { create(:task) }

  describe 'Taskモデルのバリデーションテスト' do
    it 'taskが作成出来ること' do
      expect(task).to be_valid
    end

    describe 'nameカラム' do
      it 'nameが空の場合無効であること' do
        task = build(:task, name: nil)
        expect(task.valid?).to be false
        expect(task.errors[:name]).to include('を入力してください')
      end

      it 'nameの文字数が30文字以上の場合無効であること' do
        task = build(:task, name: 'a' * 31)
        expect(task.valid?).to be false
        expect(task.errors[:name]).to include('は30文字以内で入力してください')
      end

      it 'nameが既に登録されていたら無効であること' do
        task = build(:task, name: create_task.name)
        expect(task.valid?).to be false
        expect(task.errors[:name]).to include('はすでに存在します')
      end

      it 'nameに「,」が含まれていたら無効であること' do
        task = build(:task, name: ',')
        expect(task.valid?).to be false
        expect(task.errors[:name]).to include('にカンマを含めることはできません')
      end
    end
  end
end
