Idea jots for how to handle multi-user/multi-cluster configurations
- Username provided name@realm, or name and realm seperate
- Password provided by environmental variables or file
- PVE tickets have a lifespan of two hours. Check stored tickets before requesting, if ticket age > 2 hours, get new ticket then continue with request


# Variables/Config
- Username
- Password
- TokenID
- TokenSecret


Functions for every GET request, ex: ExProxmox.Query.nodes/0, Query.node/1, Query.node
- ExProxmox.Nodes
- - nodes/0
- - node/1
- - apt/1
- - apt_changelog/1
- - apt_repositories/1
- - apt_repositories(nodeid, :post, index, node, path, digest \\ string, enabled \\ bool)
- - apt_repositories(nodeid, :put, handle, node, digest \\ string)
- - apt_update/1
- - apt_update(nodeid, :post, notify \\ bool, quiet \\ bool)
- - 

ExProxmox.Nodes.node
ExProxmox.Nodes.

ExProxmox.Nodes.QEMU.vms()
|> ExProxmox.request(cluster, auth)

ExProxmox.Nodes.QEMU.firewall_aliases(node, vmid)
|> ExProxmox.request(cluster, auth)

ExProxmox.Nodes.QEMU.create_firewall_alias(node, vmid, name, cidr)
|> ExProxmox.request(cluster, auth)

ExProxmox.Nodes.QEMU.ipsets(node, vmid)
|> ExProxmox.request(cluster, auth)

ExProxmox.Nodes.QEMU.ipset(node, vmid, name)
|> ExProxmox.request(cluster, auth)

ExProxmox.Nodes.QEMU.create_ipset(node, vmid, name, cidr, comment \\ "", nomatch \\ bool)
|> ExProxmox.request(cluster, auth)

ExProxmox.Nodes.QEMU.delete_ipset(node, vmid, name, force \\ bool)
|> ExProxmox.request(cluster, auth)

ExProxmox.Nodes.QEMU.ipset_cidr(node, vmid, name, cidr)
|> ExProxmox.request(cluster, auth)