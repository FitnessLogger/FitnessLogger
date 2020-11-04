import Foundation

class Global : ObservableObject {
    @Published var isLoading = false
    @Published var userId = ""
    
    func updateLoadingState(isLoading : Bool) {
        DispatchQueue.main.async {
            self.isLoading = isLoading
        }
    }
}
