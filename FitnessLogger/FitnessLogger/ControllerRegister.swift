import Foundation

struct ControllerRegister {
    
    static let global = Global()
    static let firebase = Firebase()
    
    static let programService = ProgramService(firebase: firebase)
    
}
