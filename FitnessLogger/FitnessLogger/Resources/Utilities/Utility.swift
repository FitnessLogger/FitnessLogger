import Foundation

struct Utility {
        
    /**
     Helper for delaying a section of code
     */
    static func delay(delayInSeconds delay: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + .seconds(delay), execute: closure)
    }
}
