//: Playground - noun: a place where people can play

import UIKit



func randScale() {
    
    for i to 10 {
        var randomNum = drand48()
        var myrandom = 0.0

        if randomNum <= 0.5 {
            myrandom = 0.5 + randomNum
        }
        print(myrandom)
    }
}

randScale()













