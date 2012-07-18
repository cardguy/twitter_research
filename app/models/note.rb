class Note < ActiveRecord::Base
  attr_accessible(:note_test)
  validates(:note_test, presence: true)
  belongs_to(:tweet)
  belongs_to(:user)


end
