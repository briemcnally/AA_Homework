require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email and password" do
        post :create, params: { user: { email: "brie@brie.com", password: "" } }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
      
      it "validates that the password is at least 6 characters long" do
        post :create, params: { user: { email: "brie@brie.com", password: "brie" } }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      context "with valid params" do
        it "redirects user to bands index on success"
          post :create, params: { user: { email: "brie@brie.com", password: "password" } }
          expect(response).to redirect_to(new_session_url)
      end
    end
  end
end
