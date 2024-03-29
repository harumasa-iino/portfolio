# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :image
      t.string :image_cache

      t.timestamps
    end
  end
end
