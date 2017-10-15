class Question < ApplicationRecord
  validates_presence_of :category, :body, :email, :city, :phone, :age, :gender, :last_name, :first_name, :patronymic_name
  validates :body, length: { in: 10..50000 }
  validates :chronic_diseases, length: { in: 0..50000 }
  validates :contact, length: { in: 0..10000 }
  validates :last_name, :first_name, :patronymic_name, length: { in: 6..20 }

  enum categories: { Общий_вопрос: 0, Хирургия: 1, Другое: 2 }
  CATEGORIES_LIST = ["Общий_вопрос", "Хирургия", "Другое"]

  enum genders: { Мужской: 0, Женский: 1 }
  GENDERS_LIST = ["Мужской", "Женский"]

end
