require 'uri'
require 'net/http'

class UrlResponseValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    raise unless options[:format].nil? or options[:format].is_a?(Regexp)
    configuration = { :message => "は有効なURLではありません。", :format => URI::regexp(%w(http https)) }
    configuration.update(options)
    if value =~ configuration[:format]
      begin # check header response
        response = Net::HTTP.get_response(URI.parse(value))
        case response
        when Net::HTTPSuccess then true
          puts "Response:#{response.code}"
        else
          record.errors.add(attribute, configuration[:message]) and false
        end
      rescue # Recover on DNS failures..
        record.errors.add(attribute, configuration[:message]) and false
      end
    else
      record.errors.add(attribute, configuration[:message]) and false
    end
  end

end