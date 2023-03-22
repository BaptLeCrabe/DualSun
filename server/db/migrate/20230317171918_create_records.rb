class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.string :company_name
      t.integer :company_siren
      t.string :customer_name
      t.string :customer_phone
      t.string :customer_mail
      t.string :worksite_address
      t.datetime :worksite_date
      t.integer :worksite_panels
      t.integer :worksite_panel_type_id
      t.integer :worksite_panel_digit

      t.timestamps
    end
  end
end
