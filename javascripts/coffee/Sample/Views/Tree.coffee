define [
  "dojo/_base/declare"
  "dijit/_WidgetBase"
  "dojo/request"
], (declare, _WidgetBase, request) ->
  declare "tree", [_WidgetBase],
    
    margin : 
      top: 20
      right: 120
      bottom: 20
      left: 120
    
    duration: 750
    
    root: {}
    svg: {}
    i: 0
    
    postCreate: ->
      width = 960 - @margin.right - @margin.left
      height = 800 - @margin.top - @margin.bottom
      
      @svg = d3.select(@domNode).append("svg")
          .attr("width", width + @margin.right + @margin.left)
          .attr("height", height + @margin.top + @margin.bottom)
        .append("g")
          .attr("transform", "translate(" + @margin.left + "," + @margin.top + ")")
      
      @tree = d3.layout.tree()
          .size([height, width])
      @diagonal = d3.svg.diagonal()
          .projection (d) -> [d.y, d.x] 
      
      
      request.get("/javascripts/coffee/Sample/tests/Views/flare.json", 
        handleAs: "json"
      ).then (flare) =>
        @root = flare
        @root.x0 = height / 2
        @root.y0 = 0
      
        collapse = (d) ->
          if (d.children) 
            d._children = d.children
            d._children.forEach(collapse)
            d.children = null
      
        @root.children.forEach(collapse)
        
        @update(@root)
      
      d3.select(self.frameElement).style("height", "800px")
      
    update: (source) ->
      #Compute the new @tree layout.
      nodes = @tree.nodes(@root).reverse()
      links = @tree.links(nodes)
      
      #Normalize for fixed-depth.
      nodes.forEach((d) -> d.y = d.depth * 180 )
      
      node = @svg.selectAll("g.node").data nodes, (d) =>
        return d.id || (d.id = ++@i)
     
      #Enter any new nodes at the parent's previous position.
      nodeEnter = node.enter().append("g")
          .attr("class", "node")
          .attr("transform", (d) -> "translate(" + source.y0 + "," + source.x0 + ")" )
          .on("click", (d)=> @click(d))
      
      nodeEnter.append("circle")
          .attr("r", 1e-6)
          .style("fill", (d) -> d._children ? "lightsteelblue" : "#fff" )
    
      nodeEnter.append("text")
          .attr("x", (d) -> if d.children || d._children then -10 else 10 )
          .attr("dy", ".35em")
          .attr("text-anchor", (d) -> if d.children || d._children then "end" else "start" )
          .text((d) -> d.name )
          .style("fill-opacity", 1e-6)
    
      #Transition nodes to their new position.
      nodeupdate = node.transition()
          .duration(@duration)
          .attr("transform", (d) -> "translate(" + d.y + "," + d.x + ")" )
    
      nodeupdate.select("circle")
          .attr("r", 4.5)
          .style("fill", (d) -> if d._children then "lightsteelblue" else "#fff" )
    
      nodeupdate.select("text")
          .style("fill-opacity", 1)
    
      #Transition exiting nodes to the parent's new position.
      nodeExit = node.exit().transition()
          .duration(@duration)
          .attr("transform", (d) -> "translate(" + source.y + "," + source.x + ")" )
          .remove()
    
      nodeExit.select("circle")
          .attr("r", 1e-6)
    
      nodeExit.select("text")
          .style("fill-opacity", 1e-6)
    
      #@update the links…
      link = @svg.selectAll("path.link")
          .data(links, (d) -> return d.target.id)
    
      #Enter any new links at the parent's previous position.
      link.enter().insert("path", "g")
          .attr("class", "link")
          .attr("d", (d) =>
            o = {x: source.x0, y: source.y0}
            return @diagonal({source: o, target: o})
          )
    
      #Transition links to their new position.
      link.transition()
          .duration(@duration)
          .attr("d", @diagonal)
    
      #Transition exiting nodes to the parent's new position.
      link.exit().transition()
        .duration(@duration)
        .attr("d", (d) =>
          o = {x: source.x, y: source.y}
          @diagonal({source: o, target: o})
        ).remove()
    
      #Stash the old positions for transition.
      nodes.forEach (d) ->
        d.x0 = d.x
        d.y0 = d.y
    
    click: (d) ->
      if (d.children) 
        d._children = d.children
        d.children = null
      else
        d.children = d._children
        d._children = null
      
      @update(d)