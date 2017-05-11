class BooksController < ApplicationController
  def index
    @books=Book.all
  end
  
  def new
    @book=Book.new
  end
  
   def create
      @book=Book.new(book_params)

      if @book.save
        # 成功
        redirect_to books_path, notice: "新增書本成功!"
      else
        # 失敗
        render 'new'
      end
   end
  
  def show
   @book=Book.find_by(id: params[:id])
  end
  
   def edit
      @book = Book.find_by(id: params[:id])
    end
  
   def update
      @book = Book.find_by(id: params[:id])

      if @book.update(book_params)
        # 成功
        redirect_to books_path, notice: "資料更新成功!"
      else
        # 失敗
        render :edit
      end
    end
  
 private
     def book_params
      params.require("book").permit(:name, :introduction, :author, :price)
    end

end
