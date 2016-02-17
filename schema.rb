ActiveRecord::Schema.define do
  create_table :cotacts do |t|
    t.column :name, :string
    t.column :email, :integer
  end
end