class CreateMeanings < ActiveRecord::Migration[7.0]
  def change
    create_table :meanings do |t|
      t.string :word
      t.string :first_part_of_speech
      t.string :first_definition
      t.string :second_part_of_speech
      t.string :second_definition
      t.string :third_part_of_speech
      t.string :third_definition

      t.timestamps
    end
  end
end
