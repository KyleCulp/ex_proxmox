Idea jots for how to handle multi-user/multi-cluster configurations
- Username provided name@realm, or name and realm seperate
- Password provided by environmental variables or file
- PVE tickets have a lifespan of two hours. Check stored tickets before requesting, if ticket age > 2 hours, get new ticket then continue with request


# Variables/Config
- Username
- Password
- TokenID
- TokenSecret


Functions for every GET request, ex: ExPVE.Query.nodes/0, Query.node/1, Query.node
- ExPVE.Nodes
- - nodes/0
- - node/1
- - apt/1
- - apt_changelog/1
- - apt_repositories/1
- - apt_repositories(nodeid, :post, index, node, path, digest \\ string, enabled \\ bool)
- - apt_repositories(nodeid, :put, handle, node, digest \\ string)
- - apt_update/1
- - apt_update(nodeid, :post, notify \\ bool, quiet \\ bool)


ExPVE.cluster(cluster)
|> ExPVE.Node.nodes

or 

ExPromox.set_cluster(cluster)
ExPVE.Node.nodes
ExPVE.Node.status(node)

So, we have our AuthCache store clusters, with each cluster having its own 

Function passes 