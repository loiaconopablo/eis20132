migration 5, :add_user_id_to_consultas do
  up do
    modify_table :consultas do
      add_column :user_id, Integer
    end
  end

  down do
    modify_table :consultas do
      drop_column :user_id
    end
  end
end
