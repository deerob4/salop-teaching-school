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
    |> validate_required([:title, :first_name, :last_name, :email, :school_type, :subject])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end
