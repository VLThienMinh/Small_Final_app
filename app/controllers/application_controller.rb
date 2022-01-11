class ApplicationController < ActionController::Base
  # layout 'application'
  before_action :set_layout_variables, :set_locale

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_layout_variables
    @categories = Category.all.order(:name)
  end
end
