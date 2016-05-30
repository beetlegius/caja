require 'rails_helper'

RSpec.describe "Cashs", :type => :request do
  let!(:cash) { FactoryGirl.create :cash }

  describe "GET /cashs" do
    before(:example) { get cashs_path }

    it "responds with 200 status code" do
      expect(response).to have_http_status(200)
    end
    it "responds with application/json format" do
      expect(response.content_type).to eq(Mime[:json])
    end
  end

  describe "GET /cashs/:id" do
    before(:example) { get cash_path(cash) }

    it "responds with 200 status code" do
      expect(response).to have_http_status(200)
    end
    it "responds with application/json format" do
      expect(response.content_type).to eq(Mime[:json])
    end
  end

  describe "POST /cashs" do
    context 'creating a valid cash' do
      before(:example) { post cashs_path, params: { cash: { name: 'Cash name' } } }

      it "responds with 201 status code" do
        expect(response).to have_http_status(201)
      end
      it "responds with application/json format" do
        expect(response.content_type).to eq(Mime[:json])
      end
    end

    context 'creating an invalid cash' do
      it "with an invalid cash it responds with 422 status code" do
        post cashs_path, params: { cash: { name: nil } }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PATCH /cashs/:id" do
    context 'updating a valid cash' do
      before(:example) { patch cash_path(cash), params: { cash: { name: 'New name' } } }

      it "responds with 200 status code" do
        expect(response).to have_http_status(200)
      end
      it "responds with application/json format" do
        expect(response.content_type).to eq(Mime[:json])
      end
    end

    context 'updating an invalid cash' do
      it "with an invalid cash it responds with 422 status code" do
        patch cash_path(cash), params: { cash: { name: nil } }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /cashs/:id" do
    context 'deleting a cash' do
      it "responds with 204 status code" do
        delete cash_path(cash)
        expect(response).to have_http_status(204)
      end
    end
  end

end
