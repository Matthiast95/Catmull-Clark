public class Mesh {

    private ArrayList<Face> faces;

    public Mesh() {
        faces = new ArrayList<>();
    }

    public ArrayList<Face> getFaces() {
        return faces;
    }
    
    public void setFaces(ArrayList<Face> faces){
        this.faces = faces; 
    }

    public void addFace(Face face) {
        faces.add(face);
    }
    
    public Point newEdgePoint(Edge edge) {
        float sx = edge.getStart().getX() + edge.getEnd().getX();
        float sy = edge.getStart().getY() + edge.getEnd().getY();
        float sz = edge.getStart().getZ() + edge.getEnd().getZ();

        int n = 2;

        for (Face face : faces) {
            if (face.containsEdge(edge)) {
                n++;

                Point facePoint = face.getMidpoint();
                sx += facePoint.getX();
                sy += facePoint.getY();
                sz += facePoint.getZ();
            }
        }

        return new Point(sx / n, sy / n, sz / n);
    }
  
public Point getBarycentrePoint(Point point) {
  int n = 0;
  float px = 0, py = 0, pz = 0;
  float qx = 0, qy = 0, qz = 0;
  float rx = 0, ry = 0, rz = 0;

  for (Face face : faces) {
      if (face.containsVertex(point)) {
          n++;

          Point faceMidpoint = face.getMidpoint();
          qx += faceMidpoint.getX();
          qy += faceMidpoint.getY();
          qz += faceMidpoint.getZ();

          for (Edge edge : face.getEdges()) {
              if (edge.estPoint(point)) {
                  Point edgeMidpoint = edge.getMidpointEdge();
                  rx += edgeMidpoint.getX() / 2;
                  ry += edgeMidpoint.getY() / 2;
                  rz += edgeMidpoint.getZ() / 2;
              }
          }
      }
  }

  float commonFactor = 1.0f / n;
  px = qx * commonFactor + 2 * rx * commonFactor + (n - 3) * point.getX();
  py = qy * commonFactor + 2 * ry * commonFactor + (n - 3) * point.getY();
  pz = qz * commonFactor + 2 * rz * commonFactor + (n - 3) * point.getZ();

  return new Point(px * commonFactor, py * commonFactor, pz * commonFactor);
}

}

 
