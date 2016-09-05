defmodule TeachingSchool.Repo.Migrations.AddUniqueTeacherEmailConstraint do
  use Ecto.Migration

  def change do
    create unique_index(:teachers, [:email])
  end
end
