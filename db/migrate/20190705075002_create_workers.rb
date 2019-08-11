class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.references :order, foreign_key: true
      t.string :name
      t.string :company_name
      t.string :email

      t.timestamps
    end
  end
end
