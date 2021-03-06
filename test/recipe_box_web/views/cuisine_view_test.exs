defmodule RecipeBoxWeb.CuisineViewTest do
  use RecipeBoxWeb.ConnCase, async: true
  import Phoenix.View

  alias RecipeBox.Cuisine

  test "renders index.html, displaying all cuisines", %{conn: conn} do
    cuisines = [
      %{name: "italian"},
      %{name: "greek"},
      %{name: "spanish"},
      %{name: "mexican"}
    ]

    content = render_to_string(
      RecipeBoxWeb.CuisineView,
      "index.html",
      conn: conn,
      cuisines: cuisines
    )
    
    for cuisine <- cuisines do
      assert String.contains?(content, cuisine.name)
    end
  end

  test "renders new.html, displaying new cuisine form", %{conn: conn} do
    changeset = Cuisine.changeset(%Cuisine{}, %{})

    content = render_to_string(
      RecipeBoxWeb.CuisineView,
      "new.html",
      conn: conn,
      changeset: changeset
    )

    assert content =~ "Create Cuisine"
  end
end
