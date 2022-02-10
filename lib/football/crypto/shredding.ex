defmodule Football.Crypto.Shredding do
  @moduledoc """
  Documentation for `Shredding`.
  """

  @doc """
  https://www.erlang.org/doc/man/public_key.html#decrypt_private-2
  """
  def key_pair(bits \\ 4_096) do
    {:RSAPrivateKey, _, modulus, public_exponent, _, _, _, _, _, _, _} =
      rsa_private_key = :public_key.generate_key({:rsa, bits, 65_537})

    rsa_public_key = {:RSAPublicKey, modulus, public_exponent}

    # pem_entry = :public_key.pem_entry_encode(:RSAPrivateKey, rsa_private_key)
    # private_key = :public_key.pem_encode([pem_entry])

    # public_key = :public_key.ssh_encode([{rsa_public_key, []}], :openssh_public_key)

    # IO.puts(~s/PUBLIC KEY:\n\n#{public_key}\n\nPRIVATE KEY\n\n#{private_key}/)

    {rsa_private_key, rsa_public_key}
  end

  def decrypt(encrypted_text, rsa_private_key) do
    :public_key.decrypt_private(encrypted_text, rsa_private_key)
  end

  def encrypt(clear_text, rsa_public_key) do
    :public_key.encrypt_public(clear_text, rsa_public_key)
  end
end
