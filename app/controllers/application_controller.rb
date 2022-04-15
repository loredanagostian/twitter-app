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

    def new
        @user = User.new
    end

    def create
        user = User.new(name: params['user']['name'])

        if user.save
            redirect_to "/users/#{user.id}"
        else
            flash[:error] = 'Validation has failed!'
            redirect_to '/users/new'
        end
    end
end
