class AddAddtlFieldsToReservists < ActiveRecord::Migration[7.1]
  def change
    add_column :reservists, :service_assignments, :jsonb, default: [], null: false
    add_column :reservists, :service_rank_adjustments, :jsonb, default: [], null: false
    add_column :reservists, :active_service, :jsonb, default: [], null: false

    add_column :reservists, :basic_primary, :jsonb, default: [], null: false
    add_column :reservists, :basic_secondary, :jsonb, default: [], null: false
    add_column :reservists, :basic_tertiary, :jsonb, default: [], null: false
    add_column :reservists, :basic_rotc, :jsonb, default: [], null: false
    add_column :reservists, :advance_rotc, :jsonb, default: [], null: false
    add_column :reservists, :pre_commission, :jsonb, default: [], null: false
    add_column :reservists, :post_graduate, :jsonb, default: [], null: false
    add_column :reservists, :board_eligibility, :jsonb, default: [], null: false

    add_column :reservists, :military_schooling, :jsonb, default: [], null: false
    add_column :reservists, :military_training, :jsonb, default: [], null: false
    add_column :reservists, :seminar, :jsonb, default: [], null: false

    add_column :reservists, :work_positions, :jsonb, default: [], null: false
    add_column :reservists, :military_awards, :jsonb, default: [], null: false
    add_column :reservists, :other_awards, :jsonb, default: [], null: false
    add_column :reservists, :commendations, :jsonb, default: [], null: false
    add_column :reservists, :certificates, :jsonb, default: [], null: false

    add_column :reservists, :dependents, :jsonb, default: [], null: false
    add_column :reservists, :tariff_sizes, :jsonb, default: [], null: false
    add_column :reservists, :contact_persons, :jsonb, default: [], null: false
  end
end
