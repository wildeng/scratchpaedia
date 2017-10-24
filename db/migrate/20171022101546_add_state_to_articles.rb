class AddStateToArticles < ActiveRecord::Migration[5.1]
  def change
    change_table(:articles) do |t|
      t.string :aasm_state, after: :content, default: 'published'
    end
  end
end
