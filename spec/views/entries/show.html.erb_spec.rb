require 'rails_helper'

RSpec.describe "entries/show", type: :view do
  let(:entry) { create(:entry, feeling: 'Feeling', description: 'MyText') }
  before(:each) do
    @entry = assign(:entry, entry)
  end

  before do
    render
  end

  context "renders attributes in <p>" do
    it "expect correct feeling" do
      expect(rendered).to match(/Feeling/)
    end

    it "expect correct description" do
      expect(rendered).to match(/MyText/)
    end
  end
end
