class Node {
  static var noOfNode = -1
  
  let W : Int
  let F : Int
  let number : Int

  let objIndex : Int
  var pathsTaken : [(num : Int, taken : Int)]

  var c : Double

  init(_W : Int, _F : Int, _K : Int, _obj : KnapsackObject, _objIndex : Int, _pathsTaken : [(Int, Int)]) {
    self.W = _W
    self.F = _F
    self.c = Node.calculateCost(W : _W, F : _F, K : _K, obj : _obj)
    self.number = Node.noOfNode + 1

    self.objIndex = _objIndex
    self.pathsTaken = _pathsTaken
    
    Node.noOfNode = self.number
  }

  func desc() {
    print(self.number == 0 ?
      "Root Node"
      :
      "Node no.\(self.number)"
   )
    print("W = \(self.W)")
    print("F = \(self.F)")
    print("c = \(self.c)")
  }
  
  static func calculateCost(W : Int, F : Int, K : Int, obj : KnapsackObject) -> Double {
    return Double(F) + Double(K - W) * obj.getDensity()
  }
}