class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string  :name,     null: false, default: ""
      t.text    :body,     null: false, default: ""
      t.boolean :archive,  null: false, default: false

      t.timestamps null: false
    end
  end
end
