require 'rails_helper'

RSpec.describe "Moves", :type => :request do
  let!(:cash) { FactoryGirl.create :cash }
  let!(:move) { FactoryGirl.create :move, cash: cash }

  describe "GET /cashs/:cash_id/moves" do
    before(:example) { get cash_moves_path(cash) }

    it "responds with 200 status code" do
      expect(response).to have_http_status(200)
    end
    it "responds with application/json format" do
      expect(response.content_type).to eq(Mime[:json])
    end
  end

  describe "GET /moves/:id" do
    before(:example) { get move_path(move) }

    it "responds with 200 status code" do
      expect(response).to have_http_status(200)
    end
    it "responds with application/json format" do
      expect(response.content_type).to eq(Mime[:json])
    end
  end

  describe "POST /cashs/:cash_id/moves" do
    context 'creating a valid move' do
      before(:example) { post cash_moves_path(cash), params: { move: { ammount: 100.50, kind: Move::IN } } }

      it "responds with 201 status code" do
        expect(response).to have_http_status(201)
      end
      it "responds with application/json format" do
        expect(response.content_type).to eq(Mime[:json])
      end
    end

    context 'creating an invalid move' do
      it "with an invalid move it responds with 422 status code" do
        post cash_moves_path(cash), params: { move: { ammount: nil, kind: Move::IN } }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PATCH /moves/:id" do
    context 'updating a valid move' do
      before(:example) { patch move_path(move), params: { move: { ammount: 500.20 } } }

      it "responds with 200 status code" do
        expect(response).to have_http_status(200)
      end
      it "responds with application/json format" do
        expect(response.content_type).to eq(Mime[:json])
      end
    end

    context 'updating an invalid move' do
      it "with an invalid move it responds with 422 status code" do
        patch move_path(move), params: { move: { ammount: -400 } }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /moves/:id" do
    context 'deleting a move' do
      it "responds with 204 status code" do
        delete move_path(move)
        expect(response).to have_http_status(204)
      end
    end
  end

end
