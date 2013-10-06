# coding: utf-8
class ItemsController < ApplicationController
  permits :user_id, :category_id, :content_id, :star, :name, :done_date

  # GET /items
  def index(category_id, star)
    @items = Item.mine(current_user)
    @items.where!(category_id: category_id) if category_id.present?
    @items.where!(star: star)               if star.present?

    @category_id = category_id
    @star        = star
  end

  # GET /items/1
  def show(id)
    @item = Item.mine(current_user).find_by(id: id)
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit(id)
    @item = Item.mine(current_user).find_by(id: id)
  end

  # POST /items
  def create(item)
    @item = Item.new(item.permit!)
    @item.user_id = current_user.id

    if @item.save
      # redirect_to @item, notice: 'コンテンツ履歴を作成しました。'
      redirect_to items_path, notice: 'コンテンツ履歴を作成しました。'
    else
      render action: 'new'
    end
  end

  # PUT /items/1
  def update(id, item)
    @item = Item.mine(current_user).find_by(id: id)

    if @item.update(item)
      # redirect_to @item, notice: 'コンテンツ履歴を更新しました。'
      redirect_to items_path, notice: 'コンテンツ履歴を更新しました。'
    else
      render action: 'edit'
    end
  end

  # DELETE /items/1
  def destroy(id)
    @item = Item.mine(current_user).find_by(id: id)
    @item.destroy

    redirect_to items_url
  end
end
