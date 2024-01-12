class SearchesController < ApplicationController
    def create
    @search = Search.create(search_params)
    # Process the search and broadcast to ActionCable here
    end

    def index
    @searches = Search.all
    # Calculate and display your analytics here
    end

    private

    def search_params
    params.require(:search).permit(:term, :ip)
    end
end
