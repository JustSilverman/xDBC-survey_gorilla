class CreateSurveyResponders < ActiveRecord::Migration
  def change
    create_table :survey_responders do |t|
      t.integer :survey_id
      t.integer :responder_id
      t.timestamps
    end  
  end
end
