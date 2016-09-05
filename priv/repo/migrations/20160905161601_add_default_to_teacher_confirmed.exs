defmodule TeachingSchool.Repo.Migrations.AddDefaultToTeacherConfirmed do
  use Ecto.Migration

  def change do
    alter table(:teachers) do
      modify :confirmed, :boolean, default: false
    end
  end
end
