require_relative '../../../config/environment'
require 'json'
require 'rest-client'
require 'pry'
require 'base64'


def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end


def candlestick_game_mini
    def ask_question(question, correct_answer, incorrect_answers, num)
        #! Picks random question
        array = incorrect_answers[num] << correct_answer[num]
        scroll("===========================================", 0.01)
        scroll( question[num] )
        puts " "
        #! Shuffles array to randomize answer location
        array.shuffle!
        array.each{|answer| scroll( "#{array.index(answer) + 1}. #{answer}", 0.02); puts " "}
        scroll( "===========================================", 0.01)
        scroll( "Enter the correct answer number")
        puts(' ')
        # puts correct_answer[num] #! TESTER TO GIVE CORRECT ANSWER 

        #! Answer validator
        
        def get_answer
            input = gets.chomp
            if ["1", '2', '3', '4'].include?(input)
                return input
            else 
                scroll("Not a valid answer")
                get_answer
            end
        end

        if array[get_answer.to_i - 1] == correct_answer[num]
            puts (" ")
            scroll("Correct!")
            puts(" ")
            array = []
            return true
        else 
            puts (" ")
            scroll("Incorrect. The correct answer is #{correct_answer[num]}.")
            array = []
            return false
        end 
    end



    def play(question, correct_answer, incorrect_answers)
        #! Access zombie name
        def zombie
            Zombie.where({alive: true})[0]
        end
        #! Attempt setter
        tries = 10
        correct_answers_needed = zombie.health
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
       
        #! Game mecahnics initiated here
        points = 0
        tries.times do |i|
            scroll("Question #{i + 1}.")
            scroll("#{zombie.name} asks . . . ")
            ask_question(question, correct_answer, incorrect_answers, number_checker(used_numbers)) ? points += 1 : nil
            puts ("enter 'a' to continue")


            #! FAILSAFE FOR EXTRA INPUTS
            def failsafe
                safe = gets.chomp
                if safe == 'a'
                    return
                else
                    failsafe
            end

            failsafe
            puts(" ")

        end
            
        

        failsafe
            #! Win cheecker
            if points == correct_answers_needed
                scroll("--------------------------------------------", 0.01)
                scroll("You have killed the zombie with a candlestick!")
                scroll("--------------------------------------------", 0.01)
                return true
            end
            scroll("You have #{points} out of 7 needed points ", 0.02)
            puts(" ")
            puts(" ")
        end
        #! lose because out of tries.
        scroll("--------------------------------------------", 0.01)
        scroll("              It seems like ")
        scroll("the candlestick wasn't the best choice . . . ")
        scroll("--------------------------------------------", 0.01)
        return false
    end

     #! Introduction
     scroll("===========================================", 0.01)
     intro = <<-'OKOK'

This Zombie dislikes people who are right.
      He will ask you questions, 
  and each correct answer you return, 
  your candlestick will burn brighter, 
   killing him with your firey wit.
     OKOK
     scroll(intro, 0.02)
     scroll("===========================================", 0.01)
    
    #! Selects link
    scroll("Which category would you like to attack?")
    puts(" ")
    scroll("1. Computer Science|2. History|3. Video Games|4. Television|5. Science and Nature")
    scroll("")
    general = "https://opentdb.com/api.php?amount=25&difficulty=medium&type=multiple&encode=base64"
    computer = "https://opentdb.com/api.php?amount=25&category=18&difficulty=easy&type=multiple&encode=base64"
    history = "https://opentdb.com/api.php?amount=25&category=23&difficulty=easy&type=multiple&encode=base64"
    art = "https://opentdb.com/api.php?amount=25&category=15&difficulty=easy&type=multiple&encode=base64"
    television = "https://opentdb.com/api.php?amount=25&category=14&difficulty=easy&type=multiple&encode=base64"
    science_nature = "https://opentdb.com/api.php?amount=25&category=17&difficulty=easy&type=multiple&encode=base64"

    userchoice = gets.chomp
    case userchoice.to_i
        when 1
            scroll("You've chosen Computer Science.")
            url = computer
        when 2 
            scroll("You've chosen History")
            url = history
        when 3
            scroll("You've chosen Video Games")
            url = art
        when 4 
            scroll("You've chosen Television")
            url = television
        when 5 
            scroll("You've chosen Science and Nature")
            url = science_nature
        else 
            scroll("You've been assigned with random questions")
            url = general
    end
    puts(" ")
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



    play(question, correct_answer, incorrect_answers)

end


# puts candlestick_game_mini