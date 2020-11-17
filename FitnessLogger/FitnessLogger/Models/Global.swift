import Foundation

class Global : ObservableObject {
    @Published var isLoading = false
    @Published var userId : String?
    
    func updateLoadingState(isLoading : Bool) {
        DispatchQueue.main.async {
            self.isLoading = isLoading
        }
    }
    
    func updateUserId(userId : String?) {
        self.userId = userId
        UserDefaults.standard.set(userId, forKey: "userId")
    }
}
