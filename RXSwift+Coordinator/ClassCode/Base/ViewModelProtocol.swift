//
//  ViewModelProtocol.swift
//  RXSwift+Coordinator
//
//  Created by Hoang Long on 01/08/2023.
//

import Foundation

protocol ViewModelProtocol {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
