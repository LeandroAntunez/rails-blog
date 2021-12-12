class ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end
    
    def show
    end

    def edit
        @categories = Category.all
    end

    def update
        @article.update(strong_params_article)
        redirect_to  @article
    end

    def destroy
        @article.destroy

        redirect_to root_path
    end


    def new
        @article = Article.new
        @categories = Category.all
    end

    def create
        @article = current_user.articles.create(strong_params_article)

        @article.save_categories

        redirect_to @article
    end

    def from_author
        @user = User.find(params[:user_id])
    end

    def find_article
        @article = Article.find(params[:id])
    end

    def strong_params_article
        params.require(:article).permit(:title, :content, category_elements: [])
    end

    

end
