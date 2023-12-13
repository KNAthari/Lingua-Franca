class AddPriceToLessons < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :price, :decimal
  end
end
