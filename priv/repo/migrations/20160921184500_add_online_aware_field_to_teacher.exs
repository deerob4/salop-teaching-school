defmodule TeachingSchool.Repo.Migrations.AddOnlineAwareFieldToTeacher do
  use Ecto.Migration

  def change do
    alter table(:teachers) do
      add :online_aware, :string
    end
  end
end
