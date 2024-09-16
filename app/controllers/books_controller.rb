class BooksController < ApplicationController

def create
  @books = Book.all
  @book = Book.new(book_params)
   if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
  else
     render 'index' ,status: :unprocessable_entity
   end
end

def index
  @books = Book.all
  @book= Book.new
  
  
   if @deleted_book
    flash.now[:deleted] = "Book with ID #{@deleted_book.id} was deleted"
  end
  
end

# 他のメソッドは省略

def show
  @book = Book.find(params[:id])
  
end

def edit
  @book = Book.find(params[:id])
end

def update
  @book = Book.find(params[:id])
   
   
    if @book.save
     flash[:notice] = "Book was successfully updated."
     flash[:error] = "error"
     redirect_to book_path(@book.id)
   else
     
     render'show' ,status: :unprocessable_entity
     
   end
end

def destroy
  @book = Book.find(params[:id])
  
  if @book.destroy
    @deleted_book = @book
  end
  
  redirect_to books_path

end

private
  
def book_params
  params.require(:book).permit(:title, :body)
  end
end