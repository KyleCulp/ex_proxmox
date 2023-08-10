defmodule ExPVE.Node do
  @moduledoc """
  The Nodes routes of the PVE API.
  /api2/json/nodes and all nested routes.
  """
  @moduledoc since: "0.1.0"

  def aplinfo(node) do
    # route =
  end

  def clone_aplinfo(node, storage, template) do
  end

  def config(node) do
    ExPVE.hello()
  end

  @type change_config_opts :: [
          {:acme, {binary}}
          | {:"acmedomain[n]", binary}
          | {:delete, binary}
          | {:description, binary}
          | {:"startall-onboot-delay", 0..300}
          | {:wakeonlan, binary}
        ]

  @doc """
  Change node configuration options.

  ## Examples
  ```
  Node.change_config(node, description: "Describe the node config") |> ExPVE.request!
  Node.change_config(node, acme: %{}) |> ExPVE.request!

  ```
  """
  @spec change_config(node :: binary) :: ExPVE.Operation.JSON.t()
  @spec change_config(node :: binary, opts :: change_config_opts) :: ExPVE.Operation.JSON.t()
  @params [:delimiter, :marker, :prefix, :encoding_type, :max_keys]
  def change_config(node, opts \\ []) do
  end

  def dns(node) do
  end

  def change_dns(node, opts) do
  end

  def execute(node, commands) do
  end

  def hosts(node) do
  end

  def change_hosts(node, data, digest \\ "") do

  end

  @type journal_opts :: [
          {:lastentries, integer}
          | {:startcursor, binary}
          | {:endcursor, binary}
          | {:since, integer}
          | {:until, integer}
        ]
  @doc """
  View node's journal.
  Opts:
  - lastentries: Limit to the last X lines. Conflicts with a given range (cursor or since/until).
  - startcursor: Start after the given Cursor. Conflicts with 'since'.
  - endcursor: Start after the given Cursor. Conflicts with 'until'.
  - since: Display all logs since this UNIX epoch. Conflicts with startcursor.
  - until: Display all logs until this UNIX epoch. Conflicts with endcursor.


  ## Examples
  ```

  ```
  """
  @spec journal(node :: binary) :: ExPVE.Operation.JSON.t()
  @spec journal(node :: binary, opts :: journal_opts) :: ExPVE.Operation.JSON.t()
  def journal(node, opts \\ []) do

  end

  def migrateall(node, target, opts \\ []) do

  end

  def netstat(node) do

  end

    @doc """
  View node's journal.
  Opts:
  - lastentries: Limit to the last X lines. Conflicts with a given range (cursor or since/until).
  - startcursor: Start after the given Cursor. Conflicts with 'since'.
  - endcursor: Start after the given Cursor. Conflicts with 'until'.
  - since: Display all logs since this UNIX epoch. Conflicts with startcursor.
  - until: Display all logs until this UNIX epoch. Conflicts with endcursor.


  ## Examples
  ```

  ```
  """
  def query_url_metadata(node, url, vertify_certificates \\ true) do

  end

  @doc """
  View node's system information report.

  ## Examples
  ```
  Node.report() |> ExPVE.request!
  ```
  """
  def report(node) do

  end

  @doc """
  Download RRD statistics as PNG.

  ## Examples
  ```
  Node.report() |> ExPVE.request!
  ```
  """
  def rrd(node) do

  end




end
