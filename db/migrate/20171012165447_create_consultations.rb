class CreateConsultations < ActiveRecord::Migration[5.1]
  def change
    create_table :consultations do |t|
      t.string  :first_name,      null: false, default: ""
      t.string  :last_name,       null: false, default: ""
      t.string  :patronymic_name, null: false, default: ""
      t.integer :age,             null: false, default: 0
      t.string  :gender,          null: false, default: ""
      t.string  :subject,   null: false, default: ""
      t.string  :importance,null: false, default: ""
      t.string  :category,  null: false, default: ""
      t.text    :body,      null: false, default: ""
      t.text    :chronic_diseases, null: false, default: ""
      t.string  :city,      null: false, default: ""
      t.string  :skype,     null: false, default: ""
      t.string  :email,     null: false, default: ""
      t.string  :phone,     null: false, default: ""
      t.text    :contact,   null: false, default: ""
      t.boolean :archive,   null: false, default: false

      t.timestamps null: false
    end
  end
end
