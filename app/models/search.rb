class Search < ApplicationRecord
    has_many :search_logs
  
    def self.most_common(ip:)
        where(ip: ip).order(count: :desc).limit(10)
    end

    def self.record(term:, ip:)
        search = find_or_initialize_by(term: term, ip: ip)
        search.count ||= 0
        search.count += 1
        search.save
        search_log = SearchLog.create(search: search)
        search
    end
end
