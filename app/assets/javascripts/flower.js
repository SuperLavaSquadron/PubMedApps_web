function rendering() {

  var width = 960,
  height = 500;
  
  var force = d3.layout.force()
		       .charge(-120)
		       .linkDistance(30)
		       .size([width,height])
  
  var svg = d3.select("body").append("svg")
	      .attr("width",width)
	      .attr("height",height);
  
  d3.json("assets/test.json",function(error,graph){
    force.nodes(graph.nodes)
	 .links(graph.links)
	 .start();
    
    var link = svg.selectAll(".link")
		  .data(graph.links)
		  .enter().append("line")
		  .attr("class","link")
		  .style("stroke",function(d){return "black"})
		  .style("stroke-width",function(d){return 4})
    
    var node = svg.selectAll(".node")
		  .data(graph.nodes)
		  .enter().append("circle")
		  .attr("class","node")
		  .attr("id",function(d){return d.PMID})
		  .attr("r",5)
		  .style("fill",function(d){return "red"})
		  .call(force.drag);
    
    node.append("title")
	.text(function(d) {return d.PMID});
    
    force.on("tick", function() {
      link.attr("x1", function(d) { return d.source.x; })
          .attr("y1", function(d) { return d.source.y; })
          .attr("x2", function(d) { return d.target.x; })
          .attr("y2", function(d) { return d.target.y; });
      
      node.attr("cx", function(d) { return d.x; })
          .attr("cy", function(d) { return d.y; });
    });
    
  });
}
