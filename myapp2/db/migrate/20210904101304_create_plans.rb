class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
     t.string:title
     t.datetime:startTime
     t.datetime:endTime
     t.string:memo
     t.integer:dayAll
     
     t.timestamps
    end
  end
end
