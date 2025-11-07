library(igraph)

# (a) Create an adjacency list representation 
# for an undirected graph

vertices <- c("A", "B", "C", "D", "E")

g <- make_empty_graph(n = length(vertices), directed = FALSE)
V(g)$name <- vertices 

cat("Initial Adjacency List:\n")
print(as_adj_list(g))

# (b) Function to add an edge between two vertices

add_edge <- function(graph, v1, v2) {
  graph <- add_edges(graph, c(v1, v2))
  return(graph)
}

g <- add_edge(g, "A", "B")
g <- add_edge(g, "A", "C")
g <- add_edge(g, "B", "D")
g <- add_edge(g, "C", "E")
g <- add_edge(g, "D", "E")

cat("\nUpdated Adjacency List:\n")
print(as_adj_list(g))

# (c) DFS Traversal Function

dfs_traversal <- function(graph, start_vertex) {
  dfs_result <- dfs(graph, root = start_vertex, order = TRUE)$order
  traversal <- V(graph)[dfs_result]$name
  cat("\nDFS Traversal starting from", start_vertex, ":\n")
  print(traversal)
}

dfs_traversal(g, "A")

plot(g,
     vertex.size = 30,
     vertex.color = "skyblue",
     vertex.label.color = "black",
     edge.color = "grey",
     main = "Undirected Graph (Adjacency List & DFS Traversal)")
