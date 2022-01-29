//
//  NumberGenerator.swift
//  Right on target
//
//  Created by Александр Рассохин on 19.01.2022.
//

import Foundation

protocol ValueGeneratorProtocol{
    func generateValue<T>() -> T
}

class NumberGenerator: ValueGeneratorProtocol{
    
    private var startValue: Int
    private var endValue: Int
    
    init?(startValue: Int, endValue: Int){
        guard startValue <= endValue else{
            return nil
        }
        
        
        self.startValue = startValue
        self.endValue = endValue
    }
    
    func generateValue<T>() -> T {
        return (startValue...endValue).randomElement()! as! T
    }
}
