class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new
		@article.title = params[:article][:title]
		@article.content = params[:article][:content]

		@article.save
		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update_attributes(article_params)
		@article.save
		redirect_to @article
	end

	def destroy
		article = Article.find(params[:id])
		article.delete
		redirect_to root_path
	end

	private

	def article_params
		params.require(:article).permit([:title, :content])
	end

end
