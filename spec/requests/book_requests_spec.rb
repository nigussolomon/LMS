require 'rails_helper'

RSpec.describe "BookRequests", type: :request do
  let(:valid_attributes) do
    {
      user: Faker::Name.name ,
      isbn: Faker::Lorem.word ,
      title: Faker::Lorem.word ,
      publisher: Faker::Name.name ,
      published_date: Faker::Date.forward(days: 0) ,
      category: Faker::Lorem.word ,
      status: "ACCEPTED"
    }
  end

  let(:invalid_attributes) do
    {
      user: Faker::Name.name ,
      isbn: Faker::Lorem.word ,
      title: Faker::Lorem.word ,
      publisher: Faker::Name.name ,
      published_date: Faker::Date.forward(days: 0) ,
      category: Faker::Lorem.word ,
      status: "SOMETHING"
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      3.times { create(:book_request) }
      get book_requests_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      book_request = create(:book_request)
      get book_request_url(book_request)
      expect(response).to be_successful
      expect(response.body).to include(book_request.title)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_book_request_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      book_request = create(:book_request)
      get edit_book_request_url(book_request)
      expect(response).to be_successful
      expect(response.body).to include(book_request.title)
      expect(response.body).to include(book_request.isbn)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new book' do
        expect do
          post book_requests_url, params: { book_request: valid_attributes }
        end.to change(BookRequest, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new book' do
        expect do
          post book_requests_url, params: { book_request: invalid_attributes }
        end.to change(BookRequest, :count).by(0)
      end

      it 'responds with unprocessable entity' do
        post book_requests_url, params: { book_request: invalid_attributes }
        expect(response).not_to be_successful
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          user: Faker::Name.name
        }
      end

      it 'updates the requested book' do
        book_request = create(:book_request)
        expect(book_request.user).not_to eq new_attributes[:user]
        patch book_request_url(book_request), params: { book_request: new_attributes }
        book_request.reload
        expect(book_request.user).to eq new_attributes[:user]
      end
    end

    context 'with invalid parameters' do
      it 'responds with unprocessable entity' do
        book_request = create(:book_request)
        patch book_request_url(book_request), params: { book_request: invalid_attributes }
        expect(response).not_to be_successful
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
