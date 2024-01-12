class SearchesController < ApplicationController
    def create
        @search = Search.record(term: search_params[:term], ip: request.remote_ip)

        # @search = Search.record(**search_params.merge(ip: request.remote_ip))
        ActionCable.server.broadcast('search_channel', { term: @search.term, count: @search.count, ip: @search.ip })
    end

    def index
        @searches = Search.where(ip: request.remote_ip)
        @most_common_searches = Search.most_common(ip: request.remote_ip)

        # Calculate and display your analytics here
    end

    private

    def search_params
        params.require(:search).permit(:term)
    end
end
