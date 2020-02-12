require_relative '../../../config/environment'

def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end


def candlestick_game_mini
    










end


candlestick_game_mini