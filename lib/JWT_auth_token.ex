# JWT token handling
defmodule HomepageApp.JwtAuthToken do
  # Decrypts JWT given the token and public key
  # Validates for expiration of the token
  def decode(jwt_string, public_key) do
    jwt_string
    |> Joken.token
    |> Joken.with_validation("exp", &(&1 > Joken.current_time()))
  end

  # Turns our public key string into a map
  defp signer(public_key_string) do
    public_key_string
    |> signing_key
    |> Joken.es256
  end

  # Uses JOSE to convert the public_key_string into a map
  defp signing_key(public_key_string) do
    { _, key_map} = public_key_string
      |> JOSE.JWK.from_pem
      |> JOSE.JWK.to_map
    key_map
  end
end
