class CareersController < ApplicationController
    def index
        careers = Career.all
        render json: careers
    end

end
