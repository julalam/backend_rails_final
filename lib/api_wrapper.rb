require 'httparty'

class APIWrapper
  GOOGLE_URL = "https://translation.googleapis.com/language/translate/v2?credentials="

  GOOGLE_CREDENTIALS = ENV["GOOGLE_CREDENTIALS"]
  GOOGLE_KEY = ENV["GOOGLE_KEY"]

  YANDEX_URL = "https://translate.yandex.net/api/v1.5/tr.json/translate?"
  YANDEX_KEY = ENV["YANDEX_KEY"]

  def self.translate(text, lang)
    google_url = GOOGLE_URL + GOOGLE_CREDENTIALS + "&key=" + GOOGLE_KEY + "&g=" + text + "&target=" + lang

    response = HTTParty.post(google_url)
    if response.code == 200
      return response["data"]["translations"].first["translatedText"]
    end

    yandex_url = YANDEX_URL + "key=" + YANDEX_KEY + "&text=" + text + "&lang=" + lang

    response =  HTTParty.post(yandex_url)
    if response.code == 200
      return response["text"].first
    else
      return nil
    end
  end

end
