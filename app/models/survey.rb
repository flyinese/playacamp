class Survey < ActiveRecord::Base
    def self.url_to_generic url, user
      # https://docs.google.com/forms/d/e/1FAIpQLS...BZFeCZw/viewform?usp=pp_url&entry.2029875085=Christopher+Filkins&entry.917344065=filchyboy@gmail.com&entry.1851380306&entry.873838820
      # -> https://docs.google.com/forms/d/e/1FAIpQLS...BZFeCZw/viewform?usp=pp_url&entry.2029875085=USER__name__USER&entry.917344065=USER__email__USER&entry.1851380306&entry.873838820
      url = url.dup
      user.attributes.each do |(k,v)|
        next unless v
        url.gsub!(
          /(&entry\.\d+=)(#{Regexp.escape(v.to_s.gsub(' ', '+'))})/,
          "\\1USER__#{k}__USER"
        )
      end
      url
    end
end
