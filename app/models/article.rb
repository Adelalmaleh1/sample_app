class Article < ActiveRecord::Base

validates :title, presence: true, length: { minimum: 3, maximum: 30}
validates :description, presence: true, length: {minimim: 10, maximum: 100}
end