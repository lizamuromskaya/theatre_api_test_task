# frozen_string_literal: true

class CreatePerformances < ActiveRecord::Migration[7.0]
  def change
    create_table :performances do |t|
      t.string :name
      t.daterange :date_range

      t.timestamps
    end
  end
end
