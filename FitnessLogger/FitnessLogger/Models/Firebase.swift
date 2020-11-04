import Foundation
import Firebase

struct Firebase {
    
    private let baseUrl = "https://fitneogger-23fe0.firebaseio.com/"
    private let global = ControllerRegister.global
    
    func getData<T: Codable>(returnType: T.Type, url: String, completion: @escaping (T?) -> Void) {

        self.global.updateLoadingState(isLoading: true)
        
        guard let url = URL(string: "\(baseUrl)\(url).json") else { completion(nil); return }

        NSLog("Requesting: \(url)")
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            // TODO: if we want to handle the error or respons
            _ = response
            _ = error

            if let data = data {
                do {
                    let object = try JSONDecoder().decode(returnType, from: data)
                    completion(object)
                } catch {
                    completion(nil)
                }
            }
        }.resume()
    }

    func getListOfData<T: Codable>(returnType: T.Type, url: String, completion: @escaping ([T]?) -> Void) {
        
        self.global.updateLoadingState(isLoading: true)
        
        guard let url = URL(string: "\(baseUrl)\(url).json") else { completion(nil); return }
        
        NSLog("Requesting: \(url)")
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            // TODO: if we want to handle the error or respons
            _ = response
            _ = error

            if let data = data {
                do {
                    let object = try JSONDecoder().decode([String : T].self, from: data)
                    
                    var array = [T]()
                    
                    for (_, value) in object {
                        array.append(value)
                    }
                    
                    completion(array)
                } catch {
                    completion(nil)
                }
            }
        }.resume()
        
//        getData(returnType: [String: T?].self, url: url) { (result) in
//            guard let result = result else { completion(nil); return }
//
//            var listToReturn = [T]()
//
//            for item in result {
//                if let object = item.value {
//                    listToReturn.append(object)
//                }
//            }
//
//            completion(listToReturn)
//        }
    }
    
    func postData() {
        
        
        
    }
}
