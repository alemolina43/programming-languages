class CreateProgrammingLanguages < ActiveRecord::Migration[7.2]
  def change
    create_table :programming_languages do |t|
      t.string :title
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
