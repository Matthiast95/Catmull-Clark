import java.util.ArrayList;

public class Face {

    private ArrayList<Edge> edges;

    public Face() {
        edges = new ArrayList<>();
    }

    public ArrayList<Edge> getEdges() {
        return edges;
    }

    public void addEdge(Edge edge) {
        edges.add(edge);
    }

    // Méthode pour obtenir les sommets de la face
    public ArrayList<Point> getVertices() {
        ArrayList<Point> vertices = new ArrayList<>();
        for (Edge edge : edges) {
            vertices.add(edge.getStart());
        }
        return vertices;
    }

    // Méthode pour vérifier si un point est l'un des sommets de la face
    public boolean containsVertex(Point point) {
        for (Edge edge : edges) {
            if (edge.getStart().equals(point) || edge.getEnd().equals(point)) {
                return true;
            }
        }
        return false;
    }
    
    public Point getMidpoint() {
    float sx = 0;
    float sy = 0;
    float sz = 0;

    for (Edge edge : this.edges) {
        // Utilisez les points de l'arête (edge)
        Point pointA = edge.getStart();
        Point pointB = edge.getEnd();

        sx += pointA.getX();
        sy += pointA.getY();
        sz += pointA.getZ();

        sx += pointB.getX();
        sy += pointB.getY();
        sz += pointB.getZ();
    }

    // Calcul du point médian de la face
    int numVertices = this.edges.size() * 2; // Chaque arête contribue à deux points
    float facePointX = sx / numVertices;
    float facePointY = sy / numVertices;
    float facePointZ = sz / numVertices;

    return new Point(facePointX, facePointY, facePointZ);
    }
    
    // Méthode pour vérifier si une arête est l'une des arêtes de la face
  public boolean containsEdge(Edge edge) {
    for (Edge faceEdge : edges) {
        if (faceEdge.equals(edge)) {
            return true;
        }
    }
    return false;
  } 
  
  public Boolean containsPoint(Point point){
   for(Edge edge : edges){
     if(edge.estPoint(point)){
       return true;
     }
   }
   return false;
  }
}
 
