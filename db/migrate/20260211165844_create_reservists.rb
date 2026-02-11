class CreateReservists < ActiveRecord::Migration[7.1]
  def change
    create_table :reservists, id: :uuid do |t|
      t.string :rank
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :branch_of_service
      t.string :afpsn
      t.string :primary_afsc
      t.string :duty_afsc
      t.text :other_skills
      t.string :source_of_enlistment
      t.string :soe_authority
      t.date :soe_date_of_enlistment
      t.string :soe_initial_rank
      t.string :source_of_commission
      t.string :soc_authority
      t.date :soc_date_of_enlistment
      t.string :soc_initial_rank
      t.string :reservist_classification
      t.string :classification_authority
      t.date :date_of_classification
      t.string :reserve_unit_assignment
      t.date :date_assigned
      t.string :unit_capability
      t.string :present_designation
      t.string :mobilization_center
      t.string :street_address
      t.string :city
      t.string :province
      t.string :region
      t.string :zip_code
      t.date :date_of_birth
      t.string :place_of_birth
      t.integer :age
      t.string :sex
      t.string :marital_status
      t.string :religion
      t.string :ethnic_group
      t.string :blood_type
      t.string :eye_color
      t.string :hair_color
      t.string :complexion
      t.text :identifying_marks
      t.integer :height_cm
      t.integer :weight_kg
      t.string :email
      t.string :residence_tel
      t.string :office_tel
      t.string :mobile_nr
      t.string :tin
      t.string :sss_number
      t.string :gsis_number
      t.string :philhealth_number
      t.string :pagibig_number
      t.text :dialects_spoken
      t.decimal :latitude
      t.decimal :longitude
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
