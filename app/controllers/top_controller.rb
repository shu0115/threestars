class TopController < ApplicationController
  skip_before_filter :authenticate

  # トップ
  def index
    # ログイン済みはリダイレクト
    redirect_to items_path and return if current_user.present?
  end
end
