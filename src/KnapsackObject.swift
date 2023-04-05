class KnapsackObject {
  static var objAmount = 0
  
  var w : Int
  var p : Int
  var number : Int

  init(w : Int, p : Int){
    self.w = w
    self.p = p
    self.number = KnapsackObject.objAmount + 1

    KnapsackObject.objAmount = number
  }

  func desc(){
    print("obj no. \(self.number)")
    print("w = \(self.w)")
    print("p = \(self.p)")
  }

  func getDensity() -> Double {
    return self.w != 0 ?
      Double(self.p) / Double(self.w)
      :
      0
  }
}