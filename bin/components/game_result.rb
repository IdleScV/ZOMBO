require_relative '../../config/environment'
require 'pry'




def input_result(result, character_obj, zombie_obj)
    if result == false
        character_obj.update(alive: false) 
  
    else
        zombie_obj.update(alive: false) 
       
    end
end

