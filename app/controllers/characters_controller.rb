class CharactersController < BaseController
    before_action :authenticate_user, except: [:create]
    before_action :set_character, only: [:update, :show, :destroy]

    def index
        characters = Character.user_id(session[:user_id])

        render json: characters
    end
    
    def show
        if @character.present?
            render json: @character, status: :ok
        else
            render status: :bad_request
        end
    end

    def create
        @character = Character.new(character_params.merge(user_id: session[:user_id]))
        if @character.save
          render json: @character
        else
            render json: {
                errors: @character.errors
            }, status: :unprocessable_entity
        end
    end

    def update
        if @character.present? && @character.update(character_params)
          render json: @character
        else
            render json: {
                errors: @character.errors
            }, status: :unprocessable_entity
        end
    end
    
    def destroy
        if (@character.present? && @character.destroy)
            render status: :ok
        else
            render status: :bad_request
        end
    end

    private

    def set_character
        @character = Character.user_id_from_character(session[:user_id], params[:id])
    end

    def character_params
        params.require(:character)
                .permit(
                    :name,
                    :character_class,
                    :level,
                    :strength,
                    :dexterity,
                    :constitution,
                    :intelligence,
                    :wisdom,
                    :charisma
                )             
    end
end
