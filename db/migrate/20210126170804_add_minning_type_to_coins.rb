class AddMinningTypeToCoins < ActiveRecord::Migration[5.2]
  def change
    add_reference :coins, :minning_type, foreign_key: true
  end
end
