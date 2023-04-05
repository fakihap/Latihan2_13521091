// var knapsackSolver = Solver(K : 10)

// knapsackSolver.addObject(obj : KnapsackObject(w : 4, p : 40))
// knapsackSolver.addObject(obj : KnapsackObject(w : 7, p : 42))
// knapsackSolver.addObject(obj : KnapsackObject(w : 5, p : 25))
// knapsackSolver.addObject(obj : KnapsackObject(w : 3, p : 12))

// var knapsackSolver = Solver(K : 100)

// knapsackSolver.addObject(obj : KnapsackObject(w : 100, p : 40))
// knapsackSolver.addObject(obj : KnapsackObject(w : 50, p : 35))
// knapsackSolver.addObject(obj : KnapsackObject(w : 45, p : 18))
// knapsackSolver.addObject(obj : KnapsackObject(w : 20, p : 4))
// knapsackSolver.addObject(obj : KnapsackObject(w : 10, p : 10))
// knapsackSolver.addObject(obj : KnapsackObject(w : 5, p : 2))

// var knapsackSolver = Solver(K : 30)

// knapsackSolver.addObject(obj : KnapsackObject(w : 35, p : 40))
// knapsackSolver.addObject(obj : KnapsackObject(w : 32, p : 25))
// knapsackSolver.addObject(obj : KnapsackObject(w : 25, p : 50))

// var knapsackSolver = Solver(K : 16)

// knapsackSolver.addObject(obj : KnapsackObject(w : 6, p : 12))
// knapsackSolver.addObject(obj : KnapsackObject(w : 5, p : 15))
// knapsackSolver.addObject(obj : KnapsackObject(w : 10, p : 50))
// knapsackSolver.addObject(obj : KnapsackObject(w : 5, p : 10))

// knapsackSolver.desc()

print("Masukkan kapasitas Maksimum")

let _K = Int(readLine()!)!
let knapsackSolver = Solver(K : _K)

print("Masukkan banyak object : ")
let _n = Int(readLine()!)!
print("Masukkan object knapsack : ")
for i in 1..._n {
  print("\tObject knapsack", i)
  print("\t\tweight : ", terminator: "")
  let _w = Int(readLine()!)!
  print("\t\tprofit : ", terminator: "")
  let _p = Int(readLine()!)!
  knapsackSolver.addObject(obj : KnapsackObject(w : _w, p : _p))
}

knapsackSolver.solve()