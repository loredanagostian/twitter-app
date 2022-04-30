class ApplicationController < ActionController::Base
    def helloblabla
        render html: 'Hello, salut!'
    end

    def alta_ruta
       # render html: 'Ai intrat pe alta ruta.'
    end

    def create_user
        user = User.create(name: params[:bla])
        render html: "User-ul #{user.name} cu id-ul #{user.id} a fost creat."
    end

    def main_menu

    end


end
