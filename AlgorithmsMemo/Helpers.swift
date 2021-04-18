//
//  Helpers.swift
//  AlgorithmsMemo
//
//  Created by 김우성 on 2021/04/17.
//

import Foundation
public func example(of description: String, action: () -> ()) {
  print("---Example of \(description)---")
  action()
  print()
}
