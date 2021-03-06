import SwiftUI
import Firebase

// Inspiration hentet fra: https://benmcmahen.com/authentication-with-swiftui-and-firebase/

class SessionStore : ObservableObject {
    @Published var session: User?
    @ObservedObject var global = ControllerRegister.global
    var handle: AuthStateDidChangeListenerHandle?
    @Published var programs = [TrainingProgram]()
    var programService = ControllerRegister.programService
    var isDownloading = false
    
    func listen() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            print("State changed")
            if let user = user {
                self.session = User(uid: user.uid, displayName: user.displayName, email: user.email)
                self.global.userId = user.uid
                
            } else {
                self.session = nil
            }
        }
    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut() -> Bool {
        do {
            try Auth.auth().signOut()
            self.session = nil
            self.global.updateUserId(userId: nil)
            programs.removeAll()
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func fetchDataFromFirebase() {
        if isDownloading {
            return
        }
        
        guard let currentUserId = global.userId else { return }
        isDownloading.toggle()
        self.global.updateLoadingState(isLoading: true)
        self.programService.getPrograms(for: currentUserId) { trainingPrograms in
            
            print("Downloading data")
            
            if let programs = trainingPrograms {
                for program in programs {
                    if !self.programs.contains(where: { $0.id == program.id }) {
                        DispatchQueue.main.async {
                            self.programs.append(program)
                        }
                    }
                }
            }
            self.global.updateLoadingState(isLoading: false)
            self.isDownloading = false
        }
    }
    
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    func updateTrainingProgramList(trainingProgram: TrainingProgram) {
        self.programs.append(trainingProgram)
    }
}
