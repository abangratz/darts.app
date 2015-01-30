Sequel.migration do
  change do
    create_table :players do
      primary_key :id
      column :name, 'character varying'
    end
  end
end
