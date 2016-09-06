defmodule TeachingSchool.CsvController do
  use TeachingSchool.Web, :controller
  alias TeachingSchool.{Repo, Teacher}

  def export(conn, _params) do
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("Content-Disposition", "attachment; filename=\"teachers.csv\"")
    |> send_resp(200, csv_content)
  end

  def csv_content do
    Repo.all(Teacher)
    |> format_teachers
    |> CSV.encode
    |> Enum.to_list
    |> to_string
  end

  def format_teachers(teachers) do
    for teacher <- teachers do
      [teacher.title, teacher.first_name, teacher.last_name,
       teacher.email, teacher.additional_contact, teacher.school_type,
       teacher.subject, teacher.confirmed]
    end
    |> Enum.map(fn row ->
      Enum.map(row, fn nil -> "N/A"
                       field -> field
      end)
    end)
  end
end