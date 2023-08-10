defmodule ExPVE.Request.HttpClient do
  @moduledoc """
  Specifies expected behaviour of an HTTP client.

  ExPVE allows you to use your HTTP client of choice, provided that
  it can be coerced into complying with this module's specification.

  The default is `:hackney`.

  ## Example

  Here for example is the code required to make HTTPotion comply with this spec.

  In your config you would do:

  ```
      config :ex_proxmox,
        http_client: ExPVE.Request.HTTPotion

      defmodule ExPVE.Request.HTTPotion do
        @behaviour ExPVE.Request.HttpClient
        def request(method, url, body, headers, _http_opts) do
          case HTTPotion.request(method, url,
                body: body,
                headers: headers,
                ibrowse: [headers_as_is: true]
              ) do
            %HTTPotion.Response{} = response -> {:ok, response}
            %HTTPotion.ErrorResponse{} = error -> {:error, %{reason: error}}
          end
        end
      end

  ```

  When conforming your selected HTTP Client take note of a few things:

    - The module name doesn't need to follow the same styling as this module it
      is simply your own 'HTTP Client', i.e. `MyApp.HttpClient`

    - The request function must accept the methods as described in the
      `c:request/5` callback, you can however set these as optional,
      i.e. `http_opts \\ []`

    - Ensure the call to your chosen HTTP Client is correct and the return is
      in the same format as defined in the `c:request/5` callback

  ## Example

      def request(method, url, body, headers, http_opts \\ []) do
        Mojito.request(method, url, headers, body, http_opts)
      end

  """

  @type http_method :: :get | :post | :put | :delete | :options | :head
  @callback request(
              method :: http_method,
              url :: binary,
              req_body :: binary,
              headers :: [{binary, binary}, ...],
              http_opts :: term
            ) ::
              {:ok, %{status_code: pos_integer, headers: any}}
              | {:ok, %{status_code: pos_integer, headers: any, body: binary}}
              | {:error, %{reason: any}}
end
