require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "renders new user page" do
      get :new

      expect(response).to render_template('new')
      expect(response).to have_http_status(200)

    end
  end
  describe "POST #create" do
    context "with valid params" do

      it "redirects to users page" do
        post :create, params: { user: {username: 'mike', password: '123456'}}

        expect(response).to redirect_to users_url
      end

    end
    context "with invalid params" do

      it "redirects to users page" do
        post :create, params: { user: {username: 'mike', password: '1236'}}

        expect(response).to render_template("new")
      end

    end
  end

end
