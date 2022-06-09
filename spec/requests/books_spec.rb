require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:valid_attributes) do
    {
      title:  Faker::Lorem.word,
      author:  Faker::Name.name,
      isbn:  Faker::Lorem.word,
      publisher:  Faker::Name.name,
      published_date:  Faker::Date.forward(days: 2),
      category:  Faker::Lorem.word,
      description:  Faker::Lorem.paragraph,
      copy:  3,
      status:  "AVAILABLE"
    }
  end

  let(:invalid_attributes) do
    {
      title:  nil,
      author:  Faker::Name.name,
      isbn:  Faker::Lorem.word,
      publisher:  Faker::Name.name,
      published_date:  Faker::Date.forward(days: 2),
      category:  Faker::Lorem.word,
      description:  Faker::Lorem.paragraph,
      copy:  3,
      status:  "AVAILABLE"
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      3.times { create(:book) }
      get books_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      book = create(:book)
      get book_url(book)
      expect(response).to be_successful
      expect(response.body).to include(book.title)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_book_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      book = create(:book)
      get edit_book_url(book)
      expect(response).to be_successful
      expect(response.body).to include(book.title)
      expect(response.body).to include(book.author)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new book' do
        expect do
          post books_url, params: { book: valid_attributes }
        end.to change(Book, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new book' do
        expect do
          post books_url, params: { book: invalid_attributes }
        end.to change(Book, :count).by(0)
      end

      it 'responds with unprocessable entity' do
        post books_url, params: { book: invalid_attributes }
        expect(response).not_to be_successful
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          author: Faker::Name.name
        }
      end

      it 'updates the requested book' do
        book = create(:book)
        expect(book.author).not_to eq new_attributes[:author]
        patch book_url(book), params: { book: new_attributes }
        book.reload
        expect(book.author).to eq new_attributes[:author]
      end
    end

    context 'with invalid parameters' do
      it 'responds with unprocessable entity' do
        book = create(:book)
        patch book_url(book), params: { book: invalid_attributes }
        expect(response).not_to be_successful
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
