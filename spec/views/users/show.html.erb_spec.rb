require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, create(:user, name: 'Nicolas Gleiser', email: 'valid@email.com'))
  end

  before do
    render
  end

  context "renders attributes in <p>" do
    it "expect correct username" do
      expect(rendered).to match(/Nicolas Gleiser/)
    end

    it "expect correct email" do
      expect(rendered).to match(/valid@email.com/)
    end
  end
end
