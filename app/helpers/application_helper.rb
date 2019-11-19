require "base64"
module ApplicationHelper

  def slack_post(message)
    begin
      RestClient.post(URI.encode("https://hooks.slack.com/services/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"), {text: message}.to_json)
    rescue RestClient::ExceptionWithResponse => err
      err.response
    end
  end

end
