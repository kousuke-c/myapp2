class Plan < ApplicationRecord
   validates :title, presence: true
      validates :startTime, presence: true 
      validates :endTime, presence: true
     

    
end
