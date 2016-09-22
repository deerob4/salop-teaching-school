defmodule TeachingSchool.CsvController do
  use TeachingSchool.Web, :controller
  alias TeachingSchool.{Repo, Teacher}

  @fields ~w(title first_name last_name email additional_contact
             school_type subject confirmed, aware_from, aware_other_explanation)

  def export(conn, _params) do
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("Content-Disposition", "attachment; filename=#{title}")
    |> send_resp(200, csv_content)
  end

  def csv_content do
    Teacher.by_latest
    |> Repo.all
    |> format_teachers
    |> CSV.encode(headers: @fields)
    |> Enum.to_list
    |> to_string
  end

  defp format_teachers(teachers) do
    for teacher <- teachers do
      Map.new(@fields, fn field ->
        value = Map.get(teacher, String.to_atom(field)) || "N/A"
        {field, value}
      end)
    end
  end

  defp title do
    date =
      DateTime.utc_now
      |> DateTime.to_date
      |> Date.to_string

    "teachers-#{date}.csv"
  end
end