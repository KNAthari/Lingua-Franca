class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :body
      t.references :users, foreign_key: true
      t.references :languages, null: false, foreign_key: true

      t.timestamps
    end
  end
end
