class Search < ApplicationRecord
    def self.most_common
        group(:term).order('count_id DESC').limit(10).count('id')
    end      
end
