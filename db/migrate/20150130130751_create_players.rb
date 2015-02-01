Sequel.migration do
  change do
    create_table :players do
      primary_key :id
      column :name, 'character varying'
      column :at, 'date'
      index [:name, :at], unique: true
    end
  end
end
