defmodule TeachingSchool.Repo.Migrations.RenameTeacherForeAndFamilyNames do
  use Ecto.Migration

  def change do
    rename table(:teachers), :forename, to: :first_name
    rename table(:teachers), :family_name, to: :last_name
  end
end
