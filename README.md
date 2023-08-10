# ExProxmox

<!-- MDOC !-->

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/ex-proxmox/ex_proxmox/on-push)
[![hex.pm](https://img.shields.io/hexpm/v/ex_proxmox.svg)](https://hex.pm/packages/ex_proxmox)
[![hex.pm](https://img.shields.io/hexpm/dt/ex_proxmox.svg)](https://hex.pm/packages/ex_proxmox)
[![hex.pm](https://img.shields.io/hexpm/l/ex_proxmox.svg)](https://hex.pm/packages/ex_proxmox)
[![hexdocs.pm](https://img.shields.io/badge/hexdocs-release-lightgreen.svg)](https://hexdocs.pm/ex_proxmox)
[![github.com](https://img.shields.io/github/last-commit/ex-proxmox/ex_proxmox.svg)](https://github.com/ex-proxmox/ex_proxmox/commits/master)

Proxmox client for Elixir. Heavily inspired by ex_aws. View the [Proxmox PVE API Docs](https://pve.proxmox.com/pve-docs/api-viewer/). ExProxmox has been tested on v6, v7, and v8 clusters. 

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_proxmox` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_proxmox, "~> 0.1.0"},
    {:hackney, "~> 1.9"},
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/ex_proxmox>.

### Hackney configuration

ExProxmox by default uses [hackney](https://github.com/benoitc/hackney) to make
HTTP requests to the Proxmox Cluster API. You can modify the options as such:

```elixir
config :ex_proxmox, :hackney_opts,
  follow_redirect: true,
  recv_timeout: 30_000
```



### JSON Codec Configuration

The default JSON codec is Jason.  You can choose a different one:

```elixir
config :ex_proxmox,
  json_codec: Poison
```
## Direct Usage

### Examples

## Highlighted Features

## Retries


## Testing



## License

The MIT License (MIT)

Copyright (c) 2014-2020 CargoSense, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
