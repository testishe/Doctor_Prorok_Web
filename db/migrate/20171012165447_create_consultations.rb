class CreateConsultations < ActiveRecord::Migration[5.1]
  def change
    create_table :consultations do |t|
      t.string  :subject,   null: false, default: ""
      t.string  :importance
      t.text    :body,      null: false, default: ""
      t.string  :city,      null: false, default: ""
      t.string  :skype,     null: false, default: ""
      t.string  :email,     null: false, default: ""
      t.string  :phone,     null: false, default: ""
      t.boolean :archive,   null: false, default: false

      t.timestamps null: false
    end
  end
end
