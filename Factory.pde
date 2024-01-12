public class Factory{
  public Mesh createCube(float sideLength) {
    Mesh mesh = new Mesh();

    createFace(mesh, new Point(0, 0, 0), new Point(sideLength, 0, 0), new Point(sideLength, sideLength, 0), new Point(0, sideLength, 0));
    createFace(mesh, new Point(0, 0, 0), new Point(0, 0, sideLength), new Point(0, sideLength, sideLength), new Point(0, sideLength, 0));
    createFace(mesh, new Point(sideLength, 0, 0), new Point(sideLength, sideLength, 0), new Point(sideLength, sideLength, sideLength), new Point(sideLength, 0, sideLength));
    createFace(mesh, new Point(0, 0, 0), new Point(sideLength, 0, 0), new Point(sideLength, 0, sideLength), new Point(0, 0, sideLength));
    createFace(mesh, new Point(0, 0, sideLength), new Point(sideLength, 0, sideLength), new Point(sideLength, sideLength, sideLength), new Point(0, sideLength, sideLength));
    createFace(mesh, new Point(0, sideLength, sideLength), new Point(sideLength, sideLength, sideLength), new Point(sideLength, sideLength, 0), new Point(0, sideLength, 0));

    return mesh;
}

private void createFace(Mesh mesh, Point A, Point B, Point C, Point D) {
    Face face = new Face();
    face.addEdge(new Edge(A, B));
    face.addEdge(new Edge(B, C));
    face.addEdge(new Edge(C, D));
    face.addEdge(new Edge(D, A));
    mesh.addFace(face);
}

public Mesh createTriangularPrism(float baseLength, float height) {
    Mesh mesh = new Mesh();

    // Base inférieure
    Face baseFace = new Face();
    baseFace.addEdge(new Edge(new Point(0, 0, 0), new Point(baseLength, 0, 0)));
    baseFace.addEdge(new Edge(new Point(baseLength, 0, 0), new Point(baseLength / 2.0f, (float) (Math.sqrt(3) * baseLength / 2.0), 0)));
    baseFace.addEdge(new Edge(new Point(baseLength / 2.0f, (float) (Math.sqrt(3) * baseLength / 2.0), 0), new Point(0, 0, 0)));
    mesh.addFace(baseFace);

    // Base supérieure
    Face topFace = new Face();
    topFace.addEdge(new Edge(new Point(0, 0, height), new Point(baseLength, 0, height)));
    topFace.addEdge(new Edge(new Point(baseLength, 0, height), new Point(baseLength / 2.0f, (float) (Math.sqrt(3) * baseLength / 2.0), height)));
    topFace.addEdge(new Edge(new Point(baseLength / 2.0f, (float) (Math.sqrt(3) * baseLength / 2.0), height), new Point(0, 0, height)));
    mesh.addFace(topFace);

    // Côté 1
    Face sideFace1 = new Face();
    sideFace1.addEdge(new Edge(new Point(0, 0, 0), new Point(baseLength / 2.0f, (float) (Math.sqrt(3) * baseLength / 2.0), 0)));
    sideFace1.addEdge(new Edge(new Point(baseLength / 2.0f, (float) (Math.sqrt(3) * baseLength / 2.0), 0), new Point(0, 0, height)));
    sideFace1.addEdge(new Edge(new Point(0, 0, height), new Point(0, 0, 0)));
    mesh.addFace(sideFace1);

    // Côté 2
    Face sideFace2 = new Face();
    sideFace2.addEdge(new Edge(new Point(baseLength / 2.0f, (float) (Math.sqrt(3) * baseLength / 2.0), 0), new Point(baseLength, 0, 0)));
    sideFace2.addEdge(new Edge(new Point(baseLength, 0, 0), new Point(0, 0, height)));
    sideFace2.addEdge(new Edge(new Point(0, 0, height), new Point(baseLength / 2.0f, (float) (Math.sqrt(3) * baseLength / 2.0), 0)));
    mesh.addFace(sideFace2);

    // Côté 3
    Face sideFace3 = new Face();
    sideFace3.addEdge(new Edge(new Point(baseLength, 0, 0), new Point(baseLength / 2.0f, (float) (Math.sqrt(3) * baseLength / 2.0), 0)));
    sideFace3.addEdge(new Edge(new Point(baseLength / 2.0f, (float) (Math.sqrt(3) * baseLength / 2.0), 0), new Point(baseLength / 2.0f, (float) (Math.sqrt(3) * baseLength / 2.0), height)));
    sideFace3.addEdge(new Edge(new Point(baseLength / 2.0f, (float) (Math.sqrt(3) * baseLength / 2.0), height), new Point(baseLength, 0, 0)));
    mesh.addFace(sideFace3);

    return mesh;
}




}
 
