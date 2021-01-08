class Weight < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ウェイトを選択してください' },
    { id: 2, name: '40kg-60kg' },
    { id: 3, name: '60kg-80kg' },
    { id: 4, name: '80kg-100kg' },
  ]

  include ActiveHash::Associations
  has_many :users

end
