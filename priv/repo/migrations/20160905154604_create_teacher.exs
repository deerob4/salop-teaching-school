defmodule TeachingSchool.Repo.Migrations.CreateTeacher do
  use Ecto.Migration

  def change do
    create table(:teachers) do
      add :title, :string
      add :forename, :string
      add :family_name, :string
      add :email, :string
      add :school_type, :string
      add :subject, :string
      add :additional_contact, :string

      timestamps()
    end

  end
end
