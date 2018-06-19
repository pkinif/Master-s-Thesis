
library(DiagrammeR)

a_graph <-
  create_graph() %>%
  add_node() %>%
  add_node() %>%
  add_edge(
    from = 1,
    to = 2)

a_graph %>%
  render_graph(layout = "nicely")

b_graph <-
  a_graph %>%
  delete_edge(
    from = 1,
    to = 2)

c_graph <-
  b_graph %>%
  add_node(
    from = 1,
    to = 2)

d_graph <-
  c_graph %>%
  add_node(
    type = "type_a",
    node_aes = node_aes(
      color = "steelblue",
      fillcolor = "lightblue",
      fontcolor = "gray35"),
    node_data = node_data(
      value = 2.5)) %>%
  add_edge(
    from = 4,
    to = 3,
    rel = "interacted_with",
    edge_aes = edge_aes(
      color = "red",
      arrowhead = "vee",
      tooltip = "Red Arrow"),
    edge_data = edge_data(
      value = 2.5))

d_graph %>%
  render_graph(layout = "nicely")



