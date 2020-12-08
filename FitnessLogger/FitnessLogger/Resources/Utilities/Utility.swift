import Foundation

// Inspiration fra: https://stackoverflow.com/questions/37801436/how-do-i-write-dispatch-after-gcd-in-swift-3-4-and-5/37801602

struct Utility {
        
    /**
     Helper for delaying a section of code
     */
    static func delay(delayInSeconds delay: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + .seconds(delay), execute: closure)
    }
}
