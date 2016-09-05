defmodule TeachingSchool.PageController do
  use TeachingSchool.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
