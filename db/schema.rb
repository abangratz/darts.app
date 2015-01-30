Sequel.migration do
  change do
    create_table(:players) do
      primary_key :id
      column :name, "character varying"
    end
    
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
  end
end
Sequel.migration do
  change do
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20150130130751_create_players.rb')"
  end
end
