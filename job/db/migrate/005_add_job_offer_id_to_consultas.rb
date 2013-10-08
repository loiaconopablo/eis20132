migration 5, :add_job_offer_id_to_consultas do
  up do
    modify_table :consultas do
      add_column :job_offer_id, Integer
    end
  end

  down do
    modify_table :consultas do
      drop_column :job_offer_id
    end
  end
end
