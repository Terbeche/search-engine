class SearchesController < ApplicationController
    def create
        @search = Search.create(search_params)
        ActionCable.server.broadcast 'search_channel', term: @search.term
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
