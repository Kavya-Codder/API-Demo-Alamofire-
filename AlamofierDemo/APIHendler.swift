//
//  APIHendler.swift
//  AlamofierDemo
//
//  Created by Sunil Developer on 04/12/22.
//

import Foundation
import Alamofire

class APIHendler {
    static let sharedInstance = APIHendler()
    
    func fetchingData(handler: @escaping(_ apiData:[Model])->(Void)) {
        let url = "https://api.covidtracking.com/v1/us/daily.json"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { response in
            switch response.result {
            case .success(let data):
                do{
                    let jsonData = try JSONDecoder().decode([Model].self, from: data!)
                    
                    //clouser calling
                    handler(jsonData)
                    print(jsonData)
                }catch{
                    print(error.localizedDescription)
                }
            case.failure(let error):
            print(error.localizedDescription)
            }
            
        }
    }
}
struct Model:Codable {
    var date: Int?
    var states: Int?
    var positive: Int?
    var negative: Int?
    var pending: Int?
    var hospitalizedCurrently: Int?
    var hospitalizedCumulative: Int?
    var inIcuCurrently: Int?
    var inIcuCumulative: Int?
    var onVentilatorCurrently: Int?
    var onVentilatorCumulative: Int?
    var dateChecked: String?
    var death: Int?
    var hospitalized: Int?
    var totalTestResultsc: Int?
    var lastModified: String?
    var recovered: Int?
    var total: Int?
    var posNeg: Int?
    var deathIncrease: Int?
    var hospitalizedIncrease: Int?
    var negativeIncrease: Int?
    var positiveIncrease: Int?
    var totalTestResultsIncrease: Int?
    var hash: String?
    
}
