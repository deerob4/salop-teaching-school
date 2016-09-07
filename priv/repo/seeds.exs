defmodule TeachingSchool.DatabaseSeeder do
  alias TeachingSchool.{Repo, Teacher}

  @subjects []

  "priv/static/subjects.txt"
  |> File.read!
  |> String.split("\n", trim: true)
  |> Enum.each(&(@subjects @subjects ++ [&1]))

  def insert_teacher do
    school_type = Enum.random(["primary", "secondary", "either"])
    subject = if school_type == "primary", do: nil, else: Enum.random(@subjects)

    teacher = %{
      title: Faker.Name.prefix,
      first_name: Faker.Name.first_name,
      last_name: Faker.Name.last_name,
      email: Faker.Internet.email,
      school_type: school_type,
      subject: subject,
      additional_contact: Faker.Internet.email,
      confirmed: false
    }

    Repo.insert! struct(%Teacher{}, teacher)
  end

  def clear do
    Repo.delete_all(Teacher)
  end

  def seed_teachers(count \\ 100) do
    Enum.each(1..count, fn _ -> insert_teacher end)
  end
end
