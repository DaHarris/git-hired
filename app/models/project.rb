class Project < ActiveRecord::Base
  belongs_to :user

  validates_format_of :url, with: /\Ahttp/ 



end
