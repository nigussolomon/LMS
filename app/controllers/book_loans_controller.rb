class BookLoansController < ApplicationController
    before_action :set_book_loan, only: %i[ show edit update destroy ]

    def index
        @book_loans = BookLoan.all
    end

    def new
        @book_loan = BookLoan.new
    end

    def show
    end

    def create
        @book_loan = BookLoan.new(book_loan_params)

        respond_to do |format|
            
            if @book_loan.save
                format.html {redirect_to book_loan_url(@book_loan), notice: "Loan was succesfully created"}
                format.json {render :show, status: :created, location: @book_loan}
            else
                format.html {render :new, status: :unprocessable_entity}
                format.json {render json: @book_loan.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @book_loan.update(book_loan_params)
                format.html {redirect_to book_loan_url(@book_loan), notice: "Loan was succesfully updated"}
                format.json {render :show, status: :created, location: @book_loan}
            else
                format.html {render :new, status: :unprocessable_entity}
                format.json {render json: @book_loan.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @book_loan.destroy
        respond_to do |format|
            format.html { redirect_to book_loans_url, notice: "Loan was succesfully deleted" }
            format.json {head :no_content}
        end
    end

    private

    def set_book_loan
        @book_loan = BookLoan.find(params[:id])
    end

    def book_loan_params
        params.require(:book_loan).permit(:book_id, :user, :loan_date, :return_date, :status)
    end
end
