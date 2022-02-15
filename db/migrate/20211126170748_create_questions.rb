class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
