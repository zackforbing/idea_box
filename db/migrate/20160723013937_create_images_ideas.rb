class CreateImagesIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :images_ideas do |t|
      t.references :ideas, foreign_key: true
      t.references :images, foreign_key: true

      t.timestamps
    end
  end
end
