class Record < ApplicationRecord
    has_one :worksite_panel_type
    validates :worksite_panel_digit, length: { is: 6 }
    validates :company_siren, length: { is: 9 }
    validates :company_siren, :worksite_panels, :worksite_panel_digit, numericality: { only_integer: true }
    validates :company_name , :company_siren, :customer_name, :customer_phone, :customer_mail, :worksite_address, :worksite_date, :worksite_panels, :worksite_panel_type_id, :worksite_panel_digit, presence: true
end
