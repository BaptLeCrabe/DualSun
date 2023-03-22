class CreateWorksitePanelTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :worksite_panel_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
