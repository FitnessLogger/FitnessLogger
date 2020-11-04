import Foundation

class Global : ObservableObject {
    @Published var isLoading = false
    @Published var userId = ""
}
