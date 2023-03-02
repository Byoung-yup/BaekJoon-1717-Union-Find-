//
//  main.swift
//  BaekJoon#1717
//
//  Created by 김병엽 on 2023/03/03.
//
// Reference: https://velog.io/@aurora_97/백준-1717번-집합의-표현-Swift

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = nm[0]
let m = nm[1]

var parent = Array(repeating: 0, count: n + 1)
(1...n).forEach({ parent[$0] = $0 })

func findParent(_ x: Int) -> Int {
    
    if x != parent[x] {
        parent[x] = findParent(parent[x])
    }
    
    return parent[x]
}

func union(_ a: Int, _ b: Int) {
    
    let a = findParent(a)
    let b = findParent(b)
    
    if a >= b {
        parent[a] = b
    } else {
        parent[b] = a
    }
    
}

func solution() {
    
    var ans = ""
    
    for _ in 0..<m {
        
        let t = readLine()!.split(separator: " ").map{Int(String($0))!}
        let (op,a,b) = (t[0],t[1],t[2])
        
        if op == 0 {
            union(a,b)
        } else {
            ans += findParent(a) == findParent(b) ? "YES\n" : "NO\n"
        }
    }
    
    print(ans.dropLast())
    
}

solution()
