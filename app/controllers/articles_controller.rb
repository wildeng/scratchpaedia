# frozen_string_literal: true

# main article controller
class ArticlesController < ApplicationController
  protect_from_forgery prepend: true
  before_action :authenticate_user!, except: %i[
    index show tagged_articles search_articles
  ]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @articles = Article.published_posts.paginate(page: params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def new
    @article = current_user.articles.new
  end

  def destroy
    Article.find(params[:id]).destroy
    flash[:success] = I18n.t('article.deleted')
    @articles = Article.published_posts.paginate(page: params[:page])
    render :index
  end

  def create
    @article = current_user.articles.create(allowed_params)
    case route_to
    when :save
      @article.publish_post
    when :draft
      @article.save_draft
    end
    if @article.save
      redirect_to @article, notice: I18n.t('article.saved')
    else
      flash.now[:error] = I18n.t('article.title_error')
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    case route_to
    when :save
      @article.publish_post
    when :draft
      @article.save_draft
    end
    if @article.update_attributes(allowed_params)
      redirect_to @article, notice: I18n.t('article.updated')
    else
      flash.now[:error] = I18n.t('article.title_error')
      render :edit
    end
  end

  def my_articles
    @articles = current_user.articles.paginate(page: params[:page])
    render :index
  end

  def search_articles
    @articles = Article.search_by_full_text(
      allowed_params[:fulltext]
    ).paginate(page: params[:page])
    @articles = Article.paginate(page: params[:page]) if @articles.empty?
    render :index
  end

  private

  def route_to
    params[:route_to].keys.first.to_sym
  end

  def allowed_params
    params.require(:article).permit(:content, :title, :tag_list, :fulltext)
  end

  def record_not_found
    render file: 'public/404.html', status: 404
  end
end
