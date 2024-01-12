public class Edge {

    private Point start;
    private Point end;

    public Edge(Point start, Point end) {
        this.start = start;
        this.end = end;
    }

    public Point getStart() {
        return start;
    }

    public Point getEnd() {
        return end;
    }

    public void setStart(Point start) {
        this.start = start;
    }

    public void setEnd(Point end) {
        this.end = end;
    }

    // Méthode pour calculer le point médian de l'arête
    public Point getMidpointEdge() {
        float midX = (start.getX() + end.getX()) / 2.0f;
        float midY = (start.getY() + end.getY()) / 2.0f;
        float midZ = (start.getZ() + end.getZ()) / 2.0f;

        return new Point(midX, midY, midZ);
    }
    
    // Méthode pour vérifier si un point est l'une des extrémités de l'arête
    public boolean estPoint(Point point) {
        return start.equals(point) || end.equals(point);
    }
    
    // Méthode pour comparer si deux arêtes sont égales
    public boolean equals(Edge otherEdge) {
        return (this.start.equals(otherEdge.getStart()) && this.end.equals(otherEdge.getEnd())) ||
               (this.start.equals(otherEdge.getEnd()) && this.end.equals(otherEdge.getStart()));
    }
}
 
