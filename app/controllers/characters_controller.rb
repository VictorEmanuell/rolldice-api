class CharactersController < BaseController
    before_action :authenticate_user, except: [:create]
    
    def create
        @character = Character.new(character_params)
        if @character.save
          render json: @character
        else
            render json: {
                errors: @character.errors
            }, status: :unprocessable_entity
        end
    end
    
    def index
        characters = Character.user_id(params[:user_id])

        render json: characters
    end

    def destroy
        @character = Character.find_by(id: params[:id])
        if (@character.present? && @character.destroy)
            render status: :ok
        else
            render status: :bad_request
        end
    end

    private

    def character_params
        params.require(:character).permit(:name, :character_class, :level, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :user_id)
    end
end
