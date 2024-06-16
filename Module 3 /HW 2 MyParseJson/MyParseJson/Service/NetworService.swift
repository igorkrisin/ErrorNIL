
import Foundation


protocol NetworkProtocol: AnyObject {
    var url: URL? { get set }
    var request: URLRequest? {get set}
    func sendRequest(q: String, completion: @escaping ([Results]) -> ())
    func getCharacter(q: String, id: Int, completion: @escaping (ResultsCharacter) -> ())
}

class NetworService: NetworkProtocol {
    var url: URL?
    
    var request: URLRequest?
    
    func sendRequest(q: String, completion: @escaping ([Results]) -> ()) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "rickandmortyapi.com"
        urlComponents.path = "/api/episode"
        
        self.url = urlComponents.url
        
        if let url = url {
            
            request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request!) { data, responce, err in
                guard err == nil else {
                    print(err!.localizedDescription)
                    return
                }
                if let jsonData = data {
                    do {
                        let episodesResponse = try JSONDecoder().decode(Episodes.self, from: jsonData)
                        completion(episodesResponse.results)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
    
    
    func getCharacter(q: String, id: Int, completion: @escaping (ResultsCharacter) -> ()) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "rickandmortyapi.com"
        urlComponents.path = "/api/character/\(id)"
        
        self.url = urlComponents.url
        if let url = url {
            
            request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request!) { data, responce, err in
                guard err == nil else {
                    print(err!.localizedDescription)
                    return
                }
                if let jsonData = data {
                    do {
                        let characterResponse = try JSONDecoder().decode(ResultsCharacter.self, from: jsonData)
                        completion(characterResponse)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
    
   
    
    
}




