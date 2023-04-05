// Knapsack Solver
class Solver {
  let K : Int

  var solutionFound = false
  var solutionNode : Node?

  var kObjects : [KnapsackObject] = []
  var kNodes : [Node] = []

  init(K : Int){
    self.K = K
  }

  func addObject(obj : KnapsackObject){
    self.kObjects.append(obj)

    sortObjects()    
  }

  func sortObjects() {
    self.kObjects.sort(by : {
      $0.getDensity() > $1.getDensity()
    })
  }

  func sortNodes() {
    pruneNodeIfBad()
    
    self.kNodes.sort(by : {
      return
        $0.c != $1.c ?
          $0.c < $1.c
          :
          $0.objIndex != $1.objIndex ?
            $0.objIndex < $1.objIndex
            :
            $0.number > $1.number
    })
  }

  func pruneNodeIfBad() {
    self.kNodes = self.kNodes.filter {
      // accumulated Weight is more than Knapsack
      $0.W <= self.K
    }
  }
  
  func desc() {
    print("desc")
    for obj in kObjects {
      obj.desc()
    }
    print("===")
    for node in kNodes {
      node.desc()
    }
    print("desc end")
  }

  func solve() {
    self.solutionFound = false
    
    sortObjects()
    self.kObjects.append(KnapsackObject(w : 0, p : 0))
    
    let root = 
      Node(
        _W : 0, 
        _F : 0, 
        _K : self.K, 
        _obj : self.kObjects[0],
        _objIndex : 0,
        _pathsTaken : []
      )
    self.kNodes.append(root)

    while(!self.solutionFound) {
      sortNodes()
      

      if (self.kNodes.count == 0) {
        break  
      }
      let highestCostNode = kNodes.popLast()!
      
      if (highestCostNode.objIndex == self.kObjects.count - 1) {
        self.solutionFound = true
        // save solution
        self.solutionNode = highestCostNode
        break
      }

      // take Object
      
      self.kNodes.append(Node(
        _W : highestCostNode.W + kObjects[highestCostNode.objIndex].w, 
        _F : highestCostNode.F + kObjects[highestCostNode.objIndex].p,
        _K : self.K,
        _obj : self.kObjects[highestCostNode.objIndex + 1],
        _objIndex : highestCostNode.objIndex + 1,
        _pathsTaken : highestCostNode.pathsTaken + [(num : self.kObjects[highestCostNode.objIndex].number, taken : 1)]
      ))

      // leave Object
      self.kNodes.append(Node(
        _W : highestCostNode.W, 
        _F : highestCostNode.F,
        _K : self.K,
        _obj : self.kObjects[highestCostNode.objIndex + 1],
        _objIndex : highestCostNode.objIndex + 1,
        _pathsTaken : highestCostNode.pathsTaken + [(num : self.kObjects[highestCostNode.objIndex].number, taken : 0)]
      ))
    }
    


    self.kNodes.removeAll()
    self.kObjects.removeLast()

    print("\nNode Hasil : ")
    
    self.solutionNode?.desc()
    self.solutionNode?.pathsTaken.sort(by : {
      $0.num < $1.num
    })

    print("\nSolusi Optimal : ")
    print("X = ", terminator: "")
    print(self.solutionNode!.pathsTaken.compactMap({
      $0.taken
    }))
  }
}