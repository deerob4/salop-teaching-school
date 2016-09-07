defmodule TeachingSchool.Router do
  use TeachingSchool.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TeachingSchool do
    pipe_through :browser # Use the default browser stack

    get "/", TeacherController, :new
    post "/", TeacherController, :create
    get "/teachers", TeacherController, :index
    post "/teachers", TeacherController, :update
    delete "/teachers", TeacherController, :delete

    get "/csv", CsvController, :export
  end
end
