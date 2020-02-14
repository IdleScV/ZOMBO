require_relative '../../config/environment'
require 'pry'
require 'colorize' 
require 'colorized_string'
require 'faker'

Losing = <<-'EOF'
                                                                 .-')     ('-.   
                                                                ( OO ). _(  OO)  
  ,--.   ,--.-'),-----. ,--. ,--.          ,--.     .-'),-----.(_)---\_(,------. 
   \  `.'  ( OO'  .-.  '|  | |  |          |  |.-')( OO'  .-.  /    _ | |  .---' 
 .-')     //   |  | |  ||  | | .-')        |  | OO /   |  | |  \  :` `. |  |     
(OO  \   / \_) |  |\|  ||  |_|( OO )       |  |`-' \_) |  |\|  |'..`''.(|  '--.  
 |   /  /\_  \ |  | |  ||  | | `-' /      (|  '---.' \ |  | |  .-._)   \|  .--'  
 `-./  /.__)  `'  '-'  ('  '-'(_.-'        |      |   `'  '-'  \       /|  `---. 
   `--'         `-----'  `-----'           `------'     `-----' `-----' `------'
                                        ____
                                      o8%8888,                         
                                    o88%8888888.                     
                                    8'-    -:8888b                    
                                  8'         8888                  
                                  d8.-=. ,==-.:888b                 
                                  >8 `~` :`~' d8888                 
                                  88         ,88888                 
                                  88b. `-~  ':88888                  
                                  888b v=v~ .:88888                    
                                  88888o--:':::8888                      
                                  `88888| :::' 8888b                     
                                  8888^^'       8888b                
                                d888           ,%888b.        
                                d88%            %%%8--'-.       
                              /88:.__ ,       _%-' ---  -      
                                  '''::===..-'   =  --.  `     
EOF


Winning = <<-'OKU'

                                      /|
                                     |\|
                                     |||
                                     |||
                                     |||
                                     |||
                                     |||
                                     |||
                                  ~-[{o}]-~
                                     |/|
                                     |/|
             ///~`     |\\_          `0'         =\\\\         . .
            ,  |='  ,))\_| ~-_                    _)  \      _/_/|
           / ,' ,;((((((    ~ \                  `~~~\-~-_ /~ (_/\
         /' -~/~)))))))'\_   _/'                      \_  /'  D   |
        (       (((((( ~-/ ~-/                          ~-;  /    \--_
         ~~--|   ))''    ')  `                            `~~\_    \   )
             :        (_  ~\           ,                    /~~-     ./
              \        \_   )--__  /(_/)                   |    )    )|
    ___       |_     \__/~-__    ~~   ,'      /,_;,   __--(   _/      |
  //~~\`\    /' ~~~----|     ~~~~~~~~'        \-  ((~~    __-~        |
((()   `\`\_(_     _-~~-\                      ``~~ ~~~~~~   \_      /
 )))     ~----'   /      \                                   )       )
  (         ;`~--'        :                                _-    ,;;(
            |    `\       |                             _-~    ,;;;;)
            |    /'`\     ;                          _-~          _/
           /~   /    |    )                         /;;;''  ,;;:-~
          |    /     / | /                         |;;'   ,''
          /   /     |  \\|                         |   ,;(   
        _/  /'       \  \_)                   .---__\_    \,--._______
       ( )|'         (~-_|                   (;;'  ;;;~~~/' `;;|  `;;;\
        ) `\_         |-_;;--__               ~~~----__/'    /'_______/
        `----'       (   `~--_ ~~~;;------------~~~~~ ;;;'_/'
 ____    ____  __    ______ .___________.  ______   .______     ____    ____ 
 \   \  /   / |  |  /      ||           | /  __  \  |   _  \    \   \  /   / 
  \   \/   /  |  | |  ,----'`---|  |----`|  |  |  | |  |_)  |    \   \/   /  
   \      /   |  | |  |         |  |     |  |  |  | |      /      \_    _/   
    \    /    |  | |  `----.    |  |     |  `--'  | |  |\  \----.   |  |     
     \__/     |__|  \______|    |__|      \______/  | _| `._____|   |__| 

OKU
   

def scroll(text, mili_s=0.03)
  text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
  puts " "
end

def character_win(weapon_name)
  case weapon_name
    when "knife"
      scroll(<<-'EOF'
(╯°□°）╯[]++++||=======> STAB!
      EOF
      )
    when "candlestick"
      scroll(<<-'EOF'
                )
              (_)
     ~burn~   |`|
    /         | |  _()
(╯°□°）╯    \_|_|_/      
      EOF
      )
    when "rope"
      scroll(<<-'EOF'
                _______
              |/      |
              |      (_)
              |      \|/
              |       |
              |      / \
              |
 (╯°□°）╯|____|____  RIP
      EOF
      )
    when "gun"
      scroll(<<-'EOF'
          __,_____
(╯°□°）╯/ __.==--"
       /#(-'
       `-'  BANG
      EOF
      )
    when "sword"
      scroll(<<-'EOF'
(╯°□°）╯
        /| ________________
  O|===|* >________________>
        \|   SLICE!
      EOF
      )
  end
end

def zombie_win(weapon_name)
  case weapon_name
    when "knife"
      scroll(<<-'EOF'
[¬º-°]¬[]++++||=======> STAB!
      EOF
      )
    when "candlestick"
      scroll(<<-'EOF'
                )
              (_)
     ~burn~   |`|
    /         | |  _()
[¬º-°]¬     \_|_|_/      
      EOF
      )
    when "rope"
      scroll(<<-'EOF'
                _______
              |/      |
              |      (_)
              |      \|/
              |       |
              |      / \
              |
  [¬º-°]¬|____|____  RIP
      EOF
      )
    when "gun"
      scroll(<<-'EOF'
          __,_____
 [¬º-°]¬/ __.==--"
       /#(-'
       `-'  BANG
      EOF
      )
    when "sword"
      scroll(<<-'EOF'
  [¬º-°]¬ 
        /| ________________
  O|===|* >________________>
        \|   SLICE!
      EOF
      )
  end
end




def credits
  fights = 0
  while fights < Fight.all.length do 
      array = Fight.all[fights]
      if array[:win] == true
          scroll(" ")
          scroll("Champion #{array.character[:name]} took down #{array.zombie[:name]}. . . . ".colorize(:green), 0.03)
          scroll(" ")
          character_win(array.weapon[:weapon_name])
          scroll(" ")
      elsif array[:win] == false
          scroll(" ")
          scroll("#{array.zombie[:name]} the zombie murdered #{array.character[:name]}. . . . ".colorize(:red), 0.03)
          scroll(" ")
          zombie_win(array.weapon[:weapon_name])
          scroll("#{array.character[:name]}'s last words:")
          scroll("#{Faker::Quote.famous_last_words}".colorize(:light_white))
      end
      fights += 1
  end
end

# binding.pry
