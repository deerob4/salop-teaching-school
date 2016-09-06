defmodule TeachingSchool.Teacher do
  use TeachingSchool.Web, :model

  schema "teachers" do
    field :title, :string
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :school_type, :string
    field :subject, :string
    field :additional_contact, :string
    field :confirmed, :boolean

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :first_name, :last_name, :email, :school_type, :subject, :additional_contact, :confirmed])
    |> validate_required([:title, :first_name, :last_name, :email, :school_type])
    |> validate_subject_required?
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end

  defp validate_subject_required?(changeset) do
    case get_field(changeset, :school_type) do
      "primary" -> changeset
      _ -> validate_required(changeset, :subject, message: "can't be blank if teaching secondary")
    end
  end
end
