class ApplicationController < ActionController::Base
    include SessionsHelper

    def helloblabla
        if logged_in?
            redirect_to users_path
        else
            redirect_to login_path
        end
    end

    # def alta_ruta
    #    # render html: 'Ai intrat pe alta ruta.'
    # end
    #
    # def create_user
    #     user = User.create(name: params[:bla])
    #     render html: "User-ul #{user.name} cu id-ul #{user.id} a fost creat."
    # end
    #
    # def main_menu
    #
    # end
end
