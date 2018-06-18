#create diagrammes graphics for the Beamer presentation

install.packages('DiagrammeR')
library(DiagrammeR)

#Let's use DiagrameR, and Graphviz - see http://rich-iannone.github.io/DiagrammeR/graphviz_and_mermaid.html#attributes

## CEP
grViz("
      digraph boxes_and_circles {
      layout = twopi
      # a 'graph' statement
      graph [overlap = true, fontsize = 10]
      
      # several 'node' statements
      node [shape = box, width = 1, height = 0.5,
      fontname = Helvetica, style = filled,
      color = tan]
      CEP
      
      node [shape = box,
      fixedsize = true,
      width = 1, height = 0.5, style = filled,
      color = OliveDrab] // sets as circles
      Outcome; Process
      
      # several 'node' statements
      node [shape = box,
      fontname = Helvetica, style = filled, width = 1, height = 0.5,
      color = Ivory]
      CaP; WastP; Wap; SPL; STL; AS
      
      # several 'edge' statements
      CEP->Outcome CEP->Process
      Outcome->CaP Outcome->Wap Outcome->WastP 
      Process->SPL Process->STL Process->AS
      }
      ")

## CFP
grViz("
      digraph boxes_and_circles {
      layout = dot
      # a 'graph' statement
      graph [overlap = true, fontsize = 10,width = 1, height = 0.5,]
      
      # several 'node' statements
      node [shape = box,
      fontname = Helvetica, style = filled,
      color = tan]
      CFP
      
      node [shape = box,
      fixedsize = true,
      width = 1, style = filled,
      color = OliveDrab] // sets as circles
      Market; Accounting

      node [shape = egg,
      fixedsize = true,
      width = 1, style = filled,
      color = DeepSkyBlue] // sets as circles
      Perceptual
      
      # several 'node' statements
      node [shape = box,
      fontname = Helvetica, style = filled,
      color = Ivory]
      Roa, TobinsQ
      
      # several 'edge' statements
      CFP->Market CFP->Accounting CFP->Perceptual
      Market->TobinsQ Accounting->Roa  
      }
      ")


# Estimation Model
grViz("
      digraph boxes_and_circles {
      layout = dot
      # a 'graph' statement
      graph [overlap = true, fontsize = 10,width = 1, height = 0.5,]
      
      # several 'node' statements
      node [shape = box,
      fontname = Helvetica, style = filled,
      color = tan]
      A(FE?) ; B(RE?); C(Pooled OLS Estimation); D(FE estimation); E(RE estimation)
      }
      ")

mermaid("graph TB; 
        A[FE?]-->B((oui));
        A-->C((non));
        B-->BB[Fixed Effect Estimation];
        C-->D[RE?];
        D-->F((non));
        D-->E((oui));
        F-->G[Pooled OLS Estimation];
        E-->H[Hausman Test - H0 Verified?];
        H-->HHH((oui));
        H-->HHHH((non));
        HHH-->P[Random Effect Estimation];
        HHHH-->PP[Fixed Effect Estimation]
        "
)

####### Final graph - Main findings

###
# Perform more node-to-edge traversals
# from multiple nodes and with use
# of matching conditions
###

library(DiagrammeR)
library(magrittr)

# Create a random graph
# (10 nodes, 20 edges)
graph <-
  create_random_graph(
    10, 20,
    directed = TRUE,
    set_seed = 20) %>%
  set_global_graph_attrs(
    "graph", "output", "visNetwork")

# Set a seed for the various uses
# of the `sample()` function
set.seed(20)

# Use a `for` loop to randomly set
# various `type` values to nodes
for (i in 1:node_count(graph)) {
  graph %<>%
    set_node_attrs(
      nodes = i,
      node_attr = "type",
      values = sample(
        c("A", "B", "C"), 1))
}

# Use another `for` loop to randomly
# set various numerical values to
# the graph's edges
for (i in 1:edge_count(graph)) {
  graph %<>%
    set_edge_attrs(
      from = get_edges(., return_type = "df")[i, 1],
      to = get_edges(., return_type = "df")[i, 2],
      edge_attr = "data_value",
      values = sample(
        seq(0, 8, 0.5), 1))
}

# Look at the graph
graph %>% render_graph

random_graph_directed <-
  create_random_graph(
    n = 50, m = 75)
