class Consultation < ApplicationRecord
  validates_presence_of :subject, :importance, :category, :body, :email, :city, :phone, :last_name, :first_name, :patronymic_name, :age, :gender
  validates :body, length: { in: 10..50000 }
  validates :chronic_diseases, length: { in: 0..50000 }
  validates :contact, length: { in: 0..10000 }
  validates :last_name, :first_name, :patronymic_name, length: { in: 6..20 }


  enum categories: { Общий_вопрос: 0, Хирургия: 1, Другое: 2 }
  CATEGORIES_LIST = ["Общий_вопрос", "Хирургия", "Другое"]

  enum importances: { Не_срочно: 0, Нормально: 1, Срочно: 2, Очень_срочно: 3 }
  IMPORTANCES_LIST = ["Не_срочно", "Нормально", "Срочно", "Очень_срочно"]

  enum genders: { Мужской: 0, Женский: 1 }
  GENDERS_LIST = ["Мужской", "Женский"]

end
