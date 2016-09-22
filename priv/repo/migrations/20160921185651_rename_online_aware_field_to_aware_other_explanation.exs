defmodule TeachingSchool.Repo.Migrations.RenameOnlineAwareFieldToAwareOtherExplanation do
  use Ecto.Migration

  def change do
    rename table(:teachers), :online_aware, to: :aware_other_explanation
  end
end
