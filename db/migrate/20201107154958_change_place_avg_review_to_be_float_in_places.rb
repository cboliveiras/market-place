class ChangePlaceAvgReviewToBeFloatInPlaces < ActiveRecord::Migration[6.0]
  # def change
  #   change_column :places, :place_avg_review, :float
  # end

  def up
    change_column :places, :place_avg_review, :float
  end

  def down
    change_column :places, :place_avg_review, :string
  end
end
