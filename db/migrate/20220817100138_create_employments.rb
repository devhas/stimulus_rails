class CreateEmployments < ActiveRecord::Migration[7.0]
  def change
    create_table :employments do |t|
      t.string :employer
      t.datetime :date_started
      t.datetime :date_employment_ended
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
