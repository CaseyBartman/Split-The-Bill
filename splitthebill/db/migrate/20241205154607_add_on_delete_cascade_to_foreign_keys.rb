class AddOnDeleteCascadeToForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :participants, :trips
    add_foreign_key :participants, :trips, on_delete: :cascade

    remove_foreign_key :expenses, :trips
    add_foreign_key :expenses, :trips, on_delete: :cascade
  end
end
