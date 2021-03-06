class UrlValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return if value.blank?
      begin
        uri = URI.parse(value)
        resp = uri.kind_of?(URI::HTTP)
      rescue URI::InvalidURIError
        resp = false
      end
      unless resp == true
        record.errors[attribute] << (options[:message] || "It is not an url")
      end
    end
  end