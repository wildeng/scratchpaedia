# base active record class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
