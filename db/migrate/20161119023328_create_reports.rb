class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.references :reportable, polymorphic: true
      t.string :user_id

      t.timestamps
    end
  end
end
