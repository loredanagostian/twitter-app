class ApplicationController < ActionController::Base
    include SessionsHelper

    def helloblabla
        if logged_in?
                redirect_to posts_path
        else
            redirect_to login_path
        end
    end

    def check_user
        unless logged_in?
            redirect_to login_path
        end
    end

    def admin_user
        redirect_to (root_url) unless current_user.admin?
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
