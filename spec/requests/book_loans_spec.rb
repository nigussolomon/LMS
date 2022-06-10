require 'rails_helper'

RSpec.describe "BookLoans", type: :request do
  let(:valid_attributes) do
    {
      book_id:  1,
      user:  Faker::Name.name ,
      loan_date:  Faker::Date.forward(days: 0) ,
      return_date:  Faker::Date.forward(days: 15) ,
      status:  "RETURNED"
    }
  end

  let(:invalid_attributes) do
    {
      book_id:  nil,
      user:  Faker::Name.name ,
      loan_date:  Faker::Date.forward(days: 0) ,
      return_date:  Faker::Date.forward(days: 15) ,
      status:  "DUE"
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      3.times { create(:book_loan) }
      get book_loans_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      book_loan = create(:book_loan)
      get book_loan_url(book_loan)
      expect(response).to be_successful
      expect(response.body).to include(book_loan.user)
      expect(response.body).to include(book_loan.status)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_book_loan_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      book_loan = create(:book_loan)
      get edit_book_loan_url(book_loan)
      expect(response).to be_successful
      expect(response.body).to include(book_loan.user)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new book_loan' do
        expect do
          post book_loans_url, params: { book_loan: valid_attributes }
        end.to change(BookLoan, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new book_loan' do
        expect do
          post book_loans_url, params: { book_loan: invalid_attributes }
        end.to change(BookLoan, :count).by(0)
      end

      it 'responds with unprocessable entity' do
        post book_loans_url, params: { book_loan: invalid_attributes }
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
        book_loan = create(:book_loan)
        expect(book_loan.user).not_to eq new_attributes[:user]
        patch book_loan_url(book_loan), params: { book_loan: new_attributes }
        book_loan.reload
        expect(book_loan.user).to eq new_attributes[:user]
      end
    end

    context 'with invalid parameters' do
      it 'responds with unprocessable entity' do
        book_loan = create(:book_loan)
        patch book_loan_url(book_loan), params: { book_loan: invalid_attributes }
        expect(response).not_to be_successful
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end 
end
