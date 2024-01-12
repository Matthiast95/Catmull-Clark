import javax.swing.JOptionPane;
import controlP5.*;

Factory forme = new Factory();
Mesh mesh; 
color shapeColor;
Boolean pointsSub;

ControlP5 cp5;
Button cubeButton;
//Button prismeButton;
Button subdivisionButton;
Button SubdivisionPointButton;

ArrayList<Point> baryCentersPoints;
ArrayList<Point> edgePoints;
ArrayList<Point> facePoints;

void setup() {
  size(1100, 600, P3D);
  shapeColor = color(0, 255, 0);
  float arrete = Float.parseFloat(JOptionPane.showInputDialog("Entrez la longueur de l'arête : "));
  mesh = forme.createCube(arrete);
  pointsSub = false;
  
  baryCentersPoints = new ArrayList<>();
  edgePoints = new ArrayList<>();
  facePoints = new ArrayList<>();
  
  cp5 = new ControlP5(this);
  cubeButton = cp5.addButton("cubeButton")
     .setPosition(50,100)
     .setSize(200, 30)
     .setCaptionLabel("Cube");
/*    
  prismeButton = cp5.addButton("prismeButton")
     .setPosition(50,150)
     .setSize(200,30)
     .setCaptionLabel("Prisme");
*/
  subdivisionButton = cp5.addButton("subdivisionButton")
     .setPosition(50,150)
     .setSize(200,30)
     .setCaptionLabel("Subdivision");

  SubdivisionPointButton = cp5.addButton("SubdivisionPointButton")
    .setPosition(50,200)
    .setSize(200,30)
    .setCaptionLabel("SubdivisionPointButton");
}

void draw() {
  background(255);

  pushMatrix();
  translate(width / 2, height / 2, 0);
  rotateX(frameCount * 0.01);
  rotateY(frameCount * 0.01);

  drawMesh();
  if(pointsSub){
    drawSubdivisionPoints(baryCentersPoints,edgePoints,facePoints);
  }
  popMatrix();
}


void drawMesh() {
  stroke(0);
  fill(shapeColor);

  strokeWeight(5);

  for (Face face : mesh.getFaces()) {
    beginShape();

    // Dessiner la première arête
    Edge firstEdge = face.getEdges().get(0);
    Point firstPoint = firstEdge.getStart();
    vertex(firstPoint.getX(), firstPoint.getY(), firstPoint.getZ());

    // Dessiner les arêtes suivantes
    for (Edge edge : face.getEdges()) {
      Point pointS = edge.getStart();
      Point pointE = edge.getEnd();

      // Ignorer le premier point car il a déjà été ajouté
      if (!pointS.equals(firstPoint)) {
        vertex(pointS.getX(), pointS.getY(), pointS.getZ());
      }

      vertex(pointE.getX(), pointE.getY(), pointE.getZ());
    }

    endShape(CLOSE);
  }
}



void subdivide(Mesh mesh) {
    ArrayList<Face> newFaces = new ArrayList<>();

    for (Face face : mesh.getFaces()) {
        Point facePoint = face.getMidpoint();
        facePoints.add(facePoint);

        for (int i = 0; i < face.getEdges().size(); i++) {
            Edge edge = face.getEdges().get(i);
            Point end = edge.getEnd();
            Point barycentre = mesh.getBarycentrePoint(end);
            baryCentersPoints.add(barycentre);
            Point midPoint = mesh.newEdgePoint(edge);
            edgePoints.add(midPoint);

            int next = (i + 1) % face.getEdges().size();
            Edge nextEdge = face.getEdges().get(next);
            Point nextcenter = mesh.newEdgePoint(nextEdge);

            Face newFace = new Face();
            newFace.addEdge(new Edge(facePoint, midPoint));
            newFace.addEdge(new Edge(midPoint, barycentre));
            newFace.addEdge(new Edge(barycentre, nextcenter));
            newFace.addEdge(new Edge(nextcenter, facePoint));
            newFaces.add(newFace);
        }
    }

    mesh.setFaces(newFaces);
}



void subdivisionButton() {
      baryCentersPoints = new ArrayList<>();
      edgePoints = new ArrayList<>();
      facePoints = new ArrayList<>();
      subdivide(mesh);
}

void drawSubdivisionPoints(ArrayList<Point> baryCenters, ArrayList<Point> edgePoints, ArrayList<Point> facePoints) {
    // Dessiner les points de barycentre en rouge
    stroke(255, 0, 0);
    drawPoints(baryCenters);

    // Dessiner les points médians d'arête en violet
    stroke(255, 0, 255);
    drawPoints(edgePoints);

    // Dessiner les points médians de face en bleu

    stroke(0, 0, 255);
    drawPoints(facePoints);
}

void drawPoints(ArrayList<Point> points) {
    for (Point point : points) {
        pushMatrix();
        translate(point.getX(), point.getY(), point.getZ());
        sphere(8); 
        popMatrix();
    }
}




void cubeButton(){
  float arrete = Float.parseFloat(JOptionPane.showInputDialog("Entrez la longueur de l'arête : "));
  mesh = forme.createCube(arrete); 
}
/*
void prismeButton(){
  float base = Float.parseFloat(JOptionPane.showInputDialog("Entrez la longueur de la base : "));
  float hauteur = Float.parseFloat(JOptionPane.showInputDialog("Entrez la hauteur de la base : "));
  mesh = forme.createTriangularPrism(hauteur,base);
}
*/

void SubdivisionPointButton(){
  pointsSub = !pointsSub;

}
