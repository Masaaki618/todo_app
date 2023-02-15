require 'rails_helper'

RSpec.describe 'Tasks', type: :system do
  let(:task) { create(:task) }

  before do
    visit root_path
  end

  it '作成したタスクが表示されること' do
    expect(page).to have_content task.name
  end
end
