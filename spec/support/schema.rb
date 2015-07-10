ActiveRecord::Schema.define do
  self.verbose = false
  create_table :users, force: true do |t|
    t.string :password
    t.timestamps
  end
end
