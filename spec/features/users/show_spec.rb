require 'rails_helper'

describe 'user information page', type: :feature do
  let(:user) do
    User.create!(
        name: "Joseph Matheus",
        email: "valid@email.com",
        password: "strong@password333"
    )
  end

  before do
    visit user_path(user)
  end

  context "display users information" do
    it 'display correct username' do
      expect(page).to have_content 'Joseph Matheus'
    end

    it 'display correct email' do
      expect(page).to have_content 'valid@email.com'
    end
  end

end
