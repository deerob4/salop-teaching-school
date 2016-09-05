defmodule TeachingSchool.Repo.Migrations.AddConfirmedToTeacher do
  use Ecto.Migration

  def change do
    alter table(:teachers) do
      add :confirmed, :boolean
    end
  end
end
