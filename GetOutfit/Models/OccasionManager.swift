//
//  NetworkManager.swift
//  GetOutfit
//
//  Created by Алёна Максимова on 07.04.2022.
//

import Foundation


protocol OccasionManagerDelegate {
    func didUpdateWeather(_ occasionManager: OccasionManager, occasion: OccasionModel)
    func didFailWithError(error: Error)
}

struct OccasionManager {
    
    // spb.getoutfit.co:3000/items?category_id=eq.1598&color=like.*Красный*&price=lte.100000&gender=like.*female*
    
    var delegate: OccasionManagerDelegate?
    let occasionUrl = "http://spb.getoutfit.co:3000/items?"
    
    func fetchParametrs(style: String, colorTheme: [String], budget: Int, gender: String) {
        let urlString = "\(occasionUrl)categories=eq.{\(style)}&color=like.*\( colorTheme.randomElement()!)*&price=lte.\(budget)&gender=like.*\(gender)*"
        print(urlString)
        
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ occasionData: Data) -> OccasionModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(OccasionData.self, from: occasionData)
            let name = decodedData.name
            let price = decodedData.price
            let picture = decodedData.picture
            
            let occasion = OccasionModel(name: name, price: price, picture: picture)
            return occasion
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
