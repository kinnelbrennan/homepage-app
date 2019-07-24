# Gets the JWT from the cookie
# Calls our auth function to decode it
defmodule HomepageApp.JwtAuthPlug do
  import Plug.Conn
  alias HomepageApp.JwtAuthToken

  def init(opts), do: opts do
  end

  # Calls and handles our decode
  def call(conn, _opts) do
    case JwtAuthToken.decode(jwt_from_map, public_key) do
      { :success, %{token: token, claims: claims} } ->
        conn |> success(claims)
      { :error, error} ->
        conn |> forbidden
    end
  end

  defp public_key do
    # TODO: add my public key from ENV
  end

  defp success(conn, token_payload) do
    assign(conn, :claims, token_payload.claims)
    |> assign(:jwt, token_payload.token)
  end

  # Extracts JWT string from the request cookie
  defp jwt_from_cookie(conn) do
    conn
    |> Plug.Conn.get_req_header("cookie")
    |> List.first
    |> Plug.Conn.Cookies.decode
    |> token_from_map(conn)
  end

  defp token_from_map(%{"session_jwt" => jwt}, _conn), do:jwt

  defp token_from_map(_cookie_map, conn) do
    conn
    |> forbidden
  end

  defp forbidden(conn) do
    conn
    |> put_status(:unauthorized
    |> Phoenix.Controller.render(HomepageApp.ErrorView, "401.html")
    |> halt
  end
end
