class BookRequestsController < ApplicationController
    before_action :set_book_request, only: %i[ show edit update destroy ]

    def index
        @book_requests = BookRequest.all
    end

    def show
    end

    def new
        @book_request = BookRequest.new
    end

    def edit
    end

    def create
        @book_request = BookRequest.new(book_request_params)

        respond_to do |format|
            if @book_request.save
                format.html { redirect_to book_request_url(@book_request), notice: "book_request was successfully created." }
                format.json { render :show, status: :created, location: @book_request }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @book_request.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @book_request.update(book_request_params)
                format.html { redirect_to book_request_url(@book_request), notice: "book_request was successfully updated." }
                format.json { render :show, status: :ok, location: @book_request }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @book_request.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @book_request.destroy
        respond_to do |format|
            format.html { redirect_to book_requests_url, notice: "book_request was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private

    def set_book_request
        @book_request = BookRequest.find(params[:id])
    end

    def book_request_params
        params.require(:book_request).permit(:user, :isbn, :title, :publisher, :published_date, :category, :status)
    end
end
