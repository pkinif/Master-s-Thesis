###
# Create a graph, select
# the last node of the graph's
# NDF, then, select the last
# edge of the graph's EDF
###

devtools::install_github('rich-iannone/DiagrammeR')

library(DiagrammeR)
library(magrittr)

nodes <- create_nodes(1:4)

edges <-
  create_edges(
    from = 1:4,
    to = c(2:4, 1),
    data = c(8.6, 2.8, 6.3, 4.5))

graph <-
  create_graph(nodes, edges)

# Inspect the graph's NDF
get_node_df(graph)
#>   nodes type label
#> 1     1          1
#> 2     2          2
#> 3     3          3
#> 4     4          4

# Inspect the graph's EDF
get_edge_df(graph)
#>   from to rel data
#> 1    1  2      8.6
#> 2    2  3      2.8
#> 3    3  4      6.3
#> 4    4  1      4.5

# Select the last node in the graph's NDF and confirm
# that the selection was made
graph %>%
  select_last_node %>%
  get_selection
#> [1] "4"

# Select the last edge in the graph's EDF and confirm
# that the selection was made
graph %>%
  select_last_edge %>%
  get_selection
#>[1] "4->1"

# Create a graph, node-by-node and
# edge-by-edge and add attributes
graph_2 <-
  create_graph(
    graph_attrs = "output = visNetwork") %>%
  add_node %>%
  select_last_node %>%
  set_node_attrs_ws(
    "timestamp", as.character(Sys.time())) %>%
  set_node_attrs_ws("type", "A") %>%
  clear_selection %>%
  add_node %>%
  select_last_node %>%
  set_node_attrs_ws(
    "timestamp", as.character(Sys.time())) %>%
  set_node_attrs_ws("type", "B") %>%
  add_edge(1, 2, "AB") %>%
  select_last_edge %>%
  set_edge_attrs_ws(
    "timestamp", as.character(Sys.time()))

# View the new graph
graph_2 %>% render_graph