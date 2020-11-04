class AddPlaceAvgReview < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :place_avg_review, :integer, default: 0
  end
end
