require_relative '../../../config/environment'
require 'json'
require 'rest-client'
require 'pry'

def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end


def candlestick_game_mini
    comp_sci = "https://opentdb.com/api.php?amount=50&category=18&difficulty=easy&type=multiple"

    url = compsci

    def get_request(url_link)
        jresponse = RestCline.tget(url)






    get_request(url)



end


candlestick_game_mini