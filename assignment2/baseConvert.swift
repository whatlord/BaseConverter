//
//  baseConvert.swift
//  assignment2
//
//  Created by Andrew Jenkins on 10/3/22.
//

import Foundation

class BaseConvert{
    
    var num: String
    var inputType: String
    
    init(_ n: String, _ it: String){
        num = n
        inputType = it
    }
    
    func incrementDecrement(_ val: Int)->String{
        var inc: String
        switch(inputType){
        case "2":
            inc = String(val, radix: 2)
        case "8":
            inc = String(val, radix: 8)
        case "16":
            inc = String(val, radix: 16)
        default:
            inc = String(val)
        }
            return inc
        
    }
    
    
    func binaryToAll()-> (String, String, String, String){
        
        //binary to octal
        let octal = String(Int(num, radix: 2)!, radix: 8)
        
        //binary to decimal
        let deci = String(Int(num, radix: 2)!)
        
        //binary to hexadecimal
        let hexa = String(Int(num, radix: 2)!, radix: 16)
        
        
        return (num,octal,deci,hexa)
    }
    
    func octalToAll()->(String,String,String,String){
        
        //octal to binary
        let binary = String(Int(num, radix: 8)!, radix: 2)
        
        //octal to decimal
        let deci = String(Int(num, radix: 8)!)

        //octal to hexadecimal
        
        let hexa = String(Int(num, radix: 8)!, radix: 16)
        
        
        return (binary,num,deci,hexa)
    }
    
    func decimalToAll()->(String,String,String,String){
        
        //decimal to binary
        let binary = String(Int(num)!, radix: 2)
        
        //decimal to octal
        let octal = String(Int(num)!, radix: 8)

        //octal to hexadecimal
        
        let hexa = String(Int(num)!, radix: 16)
        
        
        return (binary,octal,num,hexa)
    }
    
    func hexadecimalToAll()->(String,String,String,String){
        
        //hexadecimal to binary
        let binary = String(Int(num, radix: 16)!, radix: 2)
        
        //hexadecimal to decimal
        let deci = String(Int(num, radix: 16)!)

        //hexadecimal to octal
        
        let octal = String(Int(num, radix: 16)!, radix: 8)
        
        
        return (binary,octal,deci,num)
    }
    
    
    
}
