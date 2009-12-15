ActiveRecord::Schema.define(:version => 0) do
  create_table :awesomes, :force => true do |t|
    t.string :title
    t.string :slug
  end
  create_table :awesomers, :force => true do |t|
    t.string :name
    t.string :path
  end
end
