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


