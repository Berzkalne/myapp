class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :school_id
      t.integer :unicorn_id
      t.string :name
      t.integer :room
    end
  end
end
