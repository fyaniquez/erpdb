class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  DECIMALES = 100 # 10 ** 2 
end
