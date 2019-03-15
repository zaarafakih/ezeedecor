
        

        



  <!--  
<html>
<head>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.3/jquery.js"></script>
<script
  src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
  integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
  crossorigin="anonymous"></script>-->       
      
<!-- 
<style>
.storeItem{
  height:100px;
  width:100px;
}
.floor{
  height:100px;
  width:100px;
  z-index:auto;
}
.home{
  z-index:100;
}

</style>
 -->




<!-- CANVAS-->
<div id="canvasDiv">
<img id="floorPlan" alt="I'm your Floor Plan!Please resize before adding a texture to me!"/>

</div>


<div id="downloadButton">

  <button type="button" id="preview">Preview</button>
<a id="download" download="ezeedecor_floorplan.png" class="btn btn-success">Download Floorplan</a>
</div>
<div id="previewSection">
</div>




<!-- toolbox-->
<div>
<table>
  

<tr>
<td><label for="floorTexture">Add a texture to the floor:</label></td>
<td>

  <table class="table-responsive table-bordered">
  <tr>
  <td>Floor Textures</td>
  <td><img id="floor_marble_blackwhite"
    src="${designImages}/floor_marble_blackwhite.jpg" alt="Black and White marble"
    class="floor" onclick="addFloorTexture('floor_marble_blackwhite')"/></td>
    
  <td><img id="floor_tile_blue" src="${designImages}/floor_tile_blue.jpg"
    alt="Blue Tile" class="floor" onclick="addFloorTexture('floor_tile_blue')"/></td>
    
<td><img id="floor_tile_grey" class="floor" src="${designImages}/floor_tile_grey.jpg"
  alt="Grey Tile" onclick="addFloorTexture('floor_tile_grey')"/></td>
<td><img id="floor_wooden" class="floor" src="${designImages}/floor_wooden.jpg"
  alt="Wooden Flooring" onclick="addFloorTexture('floor_wooden')"/></td>
<td><img id="floor_epoxy" class="floor" src="${designImages}/floor_epoxy.png" alt="Epoxy Flooring"
  onclick="addFloorTexture('floor_epoxy')"/></td>
<td><img id="floor_mosaic" class="floor" src="${designImages}/floor_mosaic.jpg"
  alt="Mosaic Flooring" onclick="addFloorTexture('floor_mosaic')"/></td>
  </tr>

</table>

</td>
</tr>
<br><hr>
<tr>
<td><label for="ezeeDecorStore"><strong>EzeeDecor Store:</strong></label></td>
<td>
<table class="table-responsive table-bordered">
<tr>
<td>BED</td>
<td><img id="bed_1" src="${designImages}/bed_1.png" alt="Bed:Failed To Load"
  class="home storeItem"/></td>
<td><img id="bed_2" src="${designImages}/bed_2.png" alt="Bed:Failed To Load"
  class="home storeItem"/></td>
<td><img id="bed_3" src="${designImages}/bed_3.png" alt="Bed:Failed To Load"
  class="home storeItem"/></td>
<td><img id="bed_4" src="${designImages}/bed_4.png" alt="Bed:Failed To Load"
  class="home storeItem"/></td>
<td><img id="bed_5" src="${designImages}/bed_5.png" alt="Bed:Failed To Load"
  class="home storeItem"/></td>
<td><img id="bed_6" src="${designImages}/bed_6.png" alt="Bed:Failed To Load"
  class="home storeItem"/></td>
</tr>

<tr>
<td>WARDROBE</td>
<td><img id="wardrobe_2" src="${designImages}/wardrobe_2.png" alt="Wardrobe:Failed To Load"
  class="home storeItem"/></td>
<td><img id="wardrobe_3" src="${designImages}/wardrobe_3.jpg" alt="Wardrobe:Failed To Load"
  class="home storeItem"/></td>
<td><img id="wardrobe_4" src="${designImages}/wardrobe_4.png" alt="Wardrobe:Failed To Load"
  class="home storeItem"/></td>
<td><img id="wardrobe_5" src="${designImages}/wardrobe_5.png" alt="Wardrobe:Failed To Load"
  class="home storeItem"/></td>
<td><img id="wardrobe_6" src="${designImages}/wardrobe_6.png" alt="Wardrobe:Failed To Load"
  class="home storeItem"/></td>
<td><img id="wardrobe_7" src="${designImages}/wardrobe_7.png" alt="Wardrobe:Failed To Load"
  class="home storeItem"/></td>
</tr>

<tr>
<td>DINING TABLE</td>
<td><img id="dinning_1" src="${designImages}/dinning_1.png" alt="Dining Table:Failed To Load"
  class="home storeItem"/></td>
<td><img id="dinning_2" src="${designImages}/dinning_2.png" alt="Dining Table:Failed To Load"
  class="home storeItem"/></td>
<td><img id="dinning_3" src="${designImages}/dinning_3.png" alt="Dining Table:Failed To Load"
  class="home storeItem"/></td>
<td><img id="dinning_4" src="${designImages}/dinning_4.png" alt="Dining Table:Failed To Load"
  class="home storeItem"/></td>
<td><img id="dinning_5" src="${designImages}/dinning_5.png" alt="Dining Table:Failed To Load"
  class="home storeItem"/></td>
</tr>

<tr>
<td>SOFA</td>
<td><img id="sofa_1" src="${designImages}/sofa_1.png" alt="Sofa:Failed To Load"
  class="home storeItem"/></td>
<td><img id="sofa_2" src="${designImages}/sofa_2.png" alt="Sofa:Failed To Load"
  class="home storeItem"/></td>
<td><img id="sofa_3" src="${designImages}/sofa_3.png" alt="Sofa:Failed To Load"
  class="home storeItem"/></td>
<td><img id="sofa_4" src="${designImages}/sofa_4.jpg" alt="Sofa:Failed To Load"
  class="home storeItem"/></td>
<td><img id="sofa_5" src="${designImages}/sofa_5.png" alt="Sofa:Failed To Load"
  class="home storeItem"/></td>
<td><img id="sofa_6" src="${designImages}/sofa_6.png" alt="Sofa:Failed To Load"
  class="home storeItem"/></td>
</tr>

<tr>
<td>RUG</td>
<td><img id="rug_1" src="${designImages}/rug_1.png" alt="Rug:Failed To Load"
  class="home storeItem rug"/></td>
<td><img id="rug_2" src="${designImages}/rug_2.jpg" alt="Rug:Failed To Load"
  class="home storeItem rug"/></td>
<td><img id="rug_3" src="${designImages}/rug_3.png" alt="Rug:Failed To Load"
  class="home storeItem rug"/></td>
<td><img id="rug_4" src="${designImages}/rug_4.png" alt="Rug:Failed To Load"
  class="home storeItem rug"/></td>
<td><img id="rug_5" src="${designImages}/rug_5.jpg" alt="Rug:Failed To Load"
  class="home storeItem rug"/></td>
<td><img id="rug_6" src="${designImages}/rug_6.png" alt="Rug:Failed To Load"
  class="home storeItem rug"/></td>
</tr>




<tr>
<td>CENTER TABLE</td>
<td><img id="centerTable_1" src="${designImages}/centerTable_1.png" alt="centerTable:Failed To Load"
  class="home storeItem centerTable"/></td>
<td><img id="centerTable_1" src="${designImages}/table_1.png" alt="centerTable:Failed To Load"
  class="home storeItem centerTable"/></td>
</tr>

<tr>
<td>ARM CHAIR</td>
<td><img id="armChair_1" src="${designImages}/armChair_1.png" alt="armChair:Failed To Load"
  class="home storeItem armChair"/></td>
  <td><img id="armChair_2" src="${designImages}/armChair_2.png" alt="armChair:Failed To Load"
    class="home storeItem armChair"/></td>
    <td><img id="armChair_3" src="${designImages}/armChair_3.png" alt="armChair:Failed To Load"
      class="home storeItem armChair"/></td>
</tr>

<tr>
<td>ARM CHAIR</td>
<td><img id="lamp_1" src="${designImages}/lamp_1.png" alt="lamp:Failed To Load"
  class="home storeItem lamp"/></td>
  <td><img id="lamp_2" src="${designImages}/lamp_2.png" alt="lamp:Failed To Load"
    class="home storeItem lamp"/></td>

</tr>


<tr>
<td>POOF</td>
<td><img id="poof_1" src="${designImages}/poof_1.png" alt="poof:Failed To Load"
  class="home storeItem"/></td>
<td><img id="poof_2" src="${designImages}/poof_2.png" alt="poof:Failed To Load"
  class="home storeItem"/></td>
</tr>
</table>
</td>
</tr>

</table>
</div>

<script>

function addFloorTexture(id){

var img=document.getElementById('floorPlan');
img.src=document.getElementById(id).src;
var canvas=document.getElementById('canvasDiv');
for(var i=0;i<=canvas.childNodes.length-1;i++){

while(canvas.firstChild){
  canvas.removeChild(canvas.firstChild);
}
}
document.getElementById('canvasDiv').appendChild(img);

}

</script>

<!--

<script type="text/javascript">
var canvas=document.getElementById("canvas");
var context=canvas.getContext("2d");
canvas.style.border   = "1px solid";
function save(){
context.save();
canvas.renderAll();
}

function restore(){
  context.restore();
}
var rect={},drag=false;

function drawFloor(){
  canvas.addEventListener('mousedown',mousedwn_floor,false);
  canvas.addEventListener('mouseup',mouseup_floor,false);
  canvas.addEventListener('mousemove',mousemv_floor,false);

}

function mousedwn_floor(e){
  rect.startX=e.pageX-this.offsetLeft;//subtract canvas padding
  rect.startY=e.pageY-this.offsetTop;
  drag=true;
}

function mouseup_floor(e){
  drag=false;


}

function mousemv_floor(e){
  if(drag){
    rect.w=(e.pageX-this.offsetLeft)-rect.startX;//current-start
    rect.h=(e.pageY-this.offsetTop)-rect.startY;
    context.clearRect(0,0,canvas.width,canvas.height);
    draw();
  }
}

function draw(){
  context.lineWidth=11;
  context.strokeRect(rect.startX,rect.startY,rect.w,rect.h);
}

function addFloorTexture(id){
  var img=new Image(10,10);
img.src=document.getElementById(id).src;
context.drawImage(img,rect.startX,rect.startY,rect.w,rect.h);

}

$(document).ready(function(){
  $(".home").draggable({
  helper:'clone'
  });
  $("#canvas").droppable({
    accept:".home",
    drop:function(event,ui){
    $(this).append($("ui.draggable").clone());
    }
  });
});


</script>

-->


      