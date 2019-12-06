require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  
  let(:valid_attributes) {
    { feeling: 'awesome', description: 'WoooWW', hour: 22 }
  }

  let(:invalid_attributes) {
    { other_feeling: 'bad mood', age: 66, admin: true }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Entry.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      entry = Entry.create! valid_attributes
      get :show, params: {id: entry.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      entry = Entry.create! valid_attributes
      get :edit, params: {id: entry.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Entry" do
        expect {
          post :create, params: {entry: valid_attributes}, session: valid_session
        }.to change(Entry, :count).by(1)
      end

      it "redirects to the created entry" do
        post :create, params: {entry: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Entry.last)
      end

      it "render success flash message" do
        post :create, params: {entry: valid_attributes}, session: valid_session
        expect(flash[:success]).to_not be_nil
      end

      it "render success flash message text" do
        post :create, params: {entry: valid_attributes}, session: valid_session
        expect(flash[:success]).to match(/Entry was successfully created./)
      end
    end

    context "with invalid params" do
      it "returns a failure response (i.e. to display the 'new' template)" do
        post :create, params: {entry: invalid_attributes}, session: valid_session
        expect(response).not_to be_successful
      end

      it "render failure flash message" do
        skip('Missing template')

        expect_any_instance_of(Entry).to receive(:save).and_return(false)
        post :create, params: {entry: invalid_attributes}, session: valid_session
        expect(flash[:error]).to_not be_nil
      end

      it "render failure flash message text" do
        skip('Missing template')

        expect_any_instance_of(Entry).to receive(:save).and_return(false)
        post :create, params: {entry: invalid_attributes}, session: valid_session
        expect(flash[:error]).to match(/Sorry, an error has occured/)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested entry" do
        entry = Entry.create! valid_attributes
        put :update, params: {id: entry.to_param, entry: new_attributes}, session: valid_session
        entry.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the entry" do
        entry = Entry.create! valid_attributes
        put :update, params: {id: entry.to_param, entry: valid_attributes}, session: valid_session
        expect(response).to redirect_to(entry)
      end

      it "render success flash message" do
        entry = Entry.create! valid_attributes
        put :update, params: {id: entry.to_param, entry: valid_attributes}, session: valid_session
        expect(flash[:success]).to_not be_nil
      end

      it "render success flash message text" do
        entry = Entry.create! valid_attributes
        put :update, params: {id: entry.to_param, entry: valid_attributes}, session: valid_session
        expect(flash[:success]).to match(/Entry was successfully updated./)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        entry = Entry.create! valid_attributes
        put :update, params: {id: entry.to_param, entry: invalid_attributes}, session: valid_session
        expect(response).not_to be_successful
      end

      it "render failure flash message" do
        skip('Missing template')

        entry = Entry.create! valid_attributes
        put :update, params: {id: entry.to_param, entry: invalid_attributes}, session: valid_session
        expect(flash[:error]).to_not be_nil
      end

      it "render failure flash message text" do
        skip('Missing template')

        entry = Entry.create! valid_attributes
        put :update, params: {id: entry.to_param, entry: invalid_attributes}, session: valid_session
        expect(flash[:error]).to match(/Sorry, an error has occured/)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested entry" do
      entry = Entry.create! valid_attributes
      expect {
        delete :destroy, params: {id: entry.to_param}, session: valid_session
      }.to change(Entry, :count).by(-1)
    end

    it "redirects to the entries list" do
      entry = Entry.create! valid_attributes
      delete :destroy, params: {id: entry.to_param}, session: valid_session
      expect(response).to redirect_to(entries_url)
    end

    it "render success flash message" do
      entry = Entry.create! valid_attributes
      post :destroy, params: {id: entry.to_param}, session: valid_session
      expect(flash[:success]).to_not be_nil
    end

    it "render success flash message text" do
      entry = Entry.create! valid_attributes
      post :destroy, params: {id: entry.to_param}, session: valid_session
      expect(flash[:success]).to match(/Entry was successfully destroyed./)
    end
  end
end
