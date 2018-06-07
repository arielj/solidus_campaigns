class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_campaigns do |t|
      t.string :title
      t.text :description
      t.date :start_at
      t.date :end_at
      t.integer :status

      t.timestamps
    end
  end
end
