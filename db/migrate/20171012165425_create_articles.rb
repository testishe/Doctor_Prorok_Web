class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string  :name,     null: false, default: ""
      t.string  :category, null: false, default: ""
      t.text    :body,     null: false, default: ""
      t.string  :picture,  null: false, default: ""
      t.boolean :archive,  null: false, default: false

      t.timestamps null: false
    end
  end
end
