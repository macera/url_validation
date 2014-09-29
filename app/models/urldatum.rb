class Urldatum < ActiveRecord::Base
  validates :url, :presence => true, :url_response => { :format => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }

  #validates :url, :url_response => true
end
