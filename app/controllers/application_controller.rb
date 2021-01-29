class ApplicationController < ActionController::Base
    before_action :set_locale

    def set_locale
      if params[:locale] #se houver um parametro 'locale'
        cookies[:locale] = params[:locale] # a variavel cookies[:locale] recebe o parametro
      end

      if cookies[:locale] # se existir uma variavel cookies[:locale]
        if I18n.locale != cookies[:locale] # E se I18n for diferente do valor dessa variavel
          I18n.locale = cookies[:locale] # o I18n recebe o valor da variavel
        end
      end
    end
end
