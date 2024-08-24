class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.string :title
      t.integer :amount
      t.string :payment_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
