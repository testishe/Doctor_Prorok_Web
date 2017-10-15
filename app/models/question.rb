class Question < ApplicationRecord
  validates_presence_of :category, :body, :email, :city, :phone
  validates :body, length: { in: 1..50000 }

  enum categories: { Общий_вопрос: 0, Хирургия: 1, Другое: 2 }
  CATEGORIES_LIST = ["Общий_вопрос", "Хирургия", "Другое"]
  
end
