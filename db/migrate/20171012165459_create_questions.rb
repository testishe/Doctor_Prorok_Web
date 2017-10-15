class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|  
      t.string  :category,  null: false, default: ""
      t.text    :body,      null: false, default: ""
      t.string  :city,      null: false, default: ""
      t.string  :email,     null: false, default: ""
      t.string  :phone,     null: false, default: ""
      t.text    :contact,   null: false, default: ""
      t.boolean :archive,   null: false, default: false

      t.timestamps null: false
    end
  end
end
