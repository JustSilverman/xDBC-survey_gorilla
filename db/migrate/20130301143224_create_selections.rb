class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :responder_id
      t.integer :response_id
      t.timestamps
    end  
  end
end
