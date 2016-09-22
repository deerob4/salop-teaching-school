defmodule TeachingSchool.Teacher do
  use TeachingSchool.Web, :model
  alias TeachingSchool.Teacher
  import Ecto.Query

  schema "teachers" do
    field :title, :string
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :school_type, :string
    field :subject, :string
    field :additional_contact, :string
    field :aware_from, :string
    field :aware_other_explanation, :string
    field :confirmed, :boolean

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :first_name, :last_name, :email, :school_type, :additional_contact, :confirmed, :aware_from])
    |> validate_required([:title, :first_name, :last_name, :email, :school_type, :aware_from])
    |> subject_required?(params)
    |> aware_other_explanation_required?(params)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, message: "has already been registered")
  end

  defp subject_required?(changeset, params) do
    case get_field(changeset, :school_type) do
      "primary" ->
        changeset

      _other ->
        changeset
        |> cast(params, [:subject])
        |> validate_required(:subject, message: "can't be blank if teaching secondary")
    end
  end

  defp aware_other_explanation_required?(changeset, params) do
    case get_field(changeset, :aware_from) do
      "online" ->
        changeset
        |> cast(params, [:aware_other_explanation])
        |> validate_required(:aware_other_explanation, message: "can't be blank if STA was found online")

      _other ->
        changeset
    end
  end

  def by_latest, do: from(t in Teacher, order_by: t.inserted_at, select: t)
end
