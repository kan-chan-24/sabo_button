class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  # セッションにユーザー識別子を設定
  before_action :set_user_identifier

  private

  def set_user_identifier
    # セッションにユーザー識別子がなければ、新しく生成して保存
    session[:user_identifier] ||= SecureRandom.uuid
  end

  # 現在のユーザー識別子を取得するヘルパーメソッド
  def current_identifier
    session[:user_identifier]
  end
end
