class Consultation < ApplicationRecord
  validates_presence_of :subject, :importance, :category, :body, :email, :city, :phone
  validates :body, length: { in: 1..50000 }

  enum categories: { Общий_вопрос: 0, Хирургия: 1, Другое: 2 }
  CATEGORIES_LIST = ["Общий_вопрос", "Хирургия", "Другое"]

  enum importances: { Не_срочно: 0, Срочно: 1, Очень_срочно: 2 }
  IMPORTANCES_LIST = ["Не_срочно", "Срочно", "Очень_срочно"]

end
