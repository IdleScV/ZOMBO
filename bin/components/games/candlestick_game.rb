require_relative '../../../config/environment'
require 'json'
require 'rest-client'
require 'pry'
require 'base64'
# require 'tty-prompt'
# prompt = TTY::Prompt.new

def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end


def candlestick_game_mini
    
    base64 = "https://opentdb.com/api.php?amount=25&difficulty=medium&type=multiple&encode=base64"

    #! Selects link
    url = base64

    def get_request(url_link)
        response = JSON.parse(RestClient.get(url_link))
        return response
    end

    # ! Uses link above
    data = get_request(url)
    question_arr = data["results"]
    question_list = question_arr.map{|question| [question['question'], question['correct_answer'], question['incorrect_answers']]}

    #! Decodes link from Base64 to english
    question = question_list.map{|question| Base64.decode64(question[0])}
    correct_answer = question_list.map{|question| Base64.decode64(question[1])}
    incorrect_answers = question_list.map{|question| question[2]}.map{|answer_set| answer_set.map{|answer| Base64.decode64(answer)}}

    

            
    

    
    def ask_question(question, correct_answer, incorrect_answers, num)
        #! Picks random question
        

        array = incorrect_answers[num] << correct_answer[num]
        scroll("===========================================", 0.01)
        scroll( question[num] + ". . . ")
        puts " "
        array.shuffle!
        array.each{|answer| scroll( "#{array.index(answer) + 1}. #{answer}", 0.02); puts " "}
        scroll( "===========================================", 0.01)
        scroll( "Enter the correct answer number")
        puts correct_answer[num] #! CORRECT ANSWER TESTER
        input = gets.chomp
        if array[input.to_i - 1] == correct_answer[num]
            
            scroll("Correct!")
            array = []
            return true
        else 
            scroll("Incorrect. The correct answer is #{correct_answer[num]}.")
            array = []
            return false
        end
        
    end



    def play(question, correct_answer, incorrect_answers)
        intro = <<-'OKOK'

        add  instructions here
        Must get 7 out of 10 quetions correct

        
        OKOK
        
        def zombie
            Zombie.where({alive: true})[0]
        end
        
        tries = 10
        #! random number but does not repeat
        used_numbers = []
        def number_checker(used_numbers)  
            number = rand(1..24)
            if used_numbers.include?(number)
                number_checker(used_numbers)
            else  
                used_numbers << number
                return number
            end
        end

        #! Introduction
        scroll("===========================================", 0.01)
        scroll(intro, 0.02)
        scroll("===========================================", 0.01)

        points = 0
        tries.times {
        scroll("#{zombie.name} asks . . . ")
        ask_question(question, correct_answer, incorrect_answers, number_checker(used_numbers)) ? points += 1 : nil
        #! Win cheecker
        if points == 7 
            scroll("-----------------------------------------------", 0.01)
            scroll("You have killed the zombie with a candle stick!")
            scroll("-----------------------------------------------", 0.01)
            return true
        end

        scroll("You have #{points} out of 7 needed points ", 0.02)
        }
        scroll("--------------------------------------------------------------", 0.01)
        scroll("It seems like the candlestick wasn't the best choice huh. . . ")
        scroll("--------------------------------------------------------------", 0.01)
        return false
    end

    play(question, correct_answer, incorrect_answers)

end


# puts candlestick_game_mini