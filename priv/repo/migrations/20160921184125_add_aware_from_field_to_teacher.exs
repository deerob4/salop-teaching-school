defmodule TeachingSchool.Repo.Migrations.AddAwareFromFieldToTeacher do
  use Ecto.Migration

  def change do
    alter table(:teachers) do
      add :aware_from, :string
    end
  end
end
