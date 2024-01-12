public class Point {
  
    private float x;
    private float y;
    private float z;

    public Point(float x, float y, float z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public float getX() {
        return x;
    }

    public float getY() {
        return y;
    }

    public float getZ() {
        return z;
    }

    public void setX(float x) {
        this.x = x;
    }

    public void setY(float y) {
        this.y = y;
    }

    public void setZ(float z) {
        this.z = z;
    }

    // Méthode pour comparer si deux points sont égaux
    public boolean equals(Point otherPoint) {
        return this.x == otherPoint.getX() && this.y == otherPoint.getY() && this.z == otherPoint.getZ();
    }
}
 
