class Search < ApplicationRecord    
    def self.most_common(ip:)
        where(ip: ip).order(count: :desc).limit(10)
    end

    def self.record(term:, ip:)
        search = find_or_initialize_by(term: term, ip: ip)
        search.count ||= 0
        search.count += 1
        search.save
        search
    end
end
