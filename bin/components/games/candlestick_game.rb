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

    #! random number but does not repeat
    used_numers = []
    number_check = rand(0..24)
    

    number = 


    
    def ask_question(question, correct_answer, incorrect_answers, num)
        #! Picks random question
        

        array = incorrect_answers[num] << correct_answer[num]
        puts "==============================="
        print question[num]
        puts " "
        array.shuffle!
        array.each{|answer| print "#{array.index(answer) + 1}. #{answer}"; puts " "}
        puts "==============================="
        puts "Enter the correct answer number"
        # puts correct_answer[num] #! CORRECT ANSWER TESTER
        input = gets.chomp
        if array[input.to_i - 1] == correct_answer[num]
            puts "Correct!"
            return true
        else 
            puts "Incorrect. The correct answer is #{correct_answer[num]}."
            return false
        end
        
    end

    def play(question, correct_answer, incorrect_answers, number)
        intro = <<-'OKOK'





        OKOK
        
        def zombie
            Zombie.where({alive: true})[0]
        end


        puts intro
        points = 0

        5.times {
        puts "#{zombie.name} asks . . . "
        ask_question(question, correct_answer, incorrect_answers) ? points += 1 : nil
        puts "You have #{points} points... "
        }
    end

    play(question, correct_answer, incorrect_answers)

end


candlestick_game_mini