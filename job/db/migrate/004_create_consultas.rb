migration 4, :create_consultas do
  up do
    create_table :consultas do
      column :id, Integer, :serial => true
      column :title, DataMapper::Property::String, :length => 255
      column :description, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :consultas
  end
end
