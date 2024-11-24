class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.references :trip, null: false, foreign_key: true
      t.string :name
      t.string :expense_type
      t.decimal :amount
      t.references :payer, null: false, foreign_key: { to_table: :users } # Explicit foreign key
      t.date :date

      t.timestamps
    end
  end
end
