////
////  Cases.swift
////  COVID-19
////
////  Created by Sachin Khanal on 4/6/20.
////  Copyright © 2020 Sachin Khanal. All rights reserved.
////
//
//import Foundation
//
//struct Cases: Decodable {
//
//    var cases: Double
//    var todayCases: Double
//    var deaths: Double
//    var todayDeaths: Double
//    var updated: Double
//    var recovered: Double
//    var active: Double
//    var critical: Double
////    var casesPerOneMillion: Double
////    var deathsPerOneMillion: Double
////    var testsPerOneMillion: Double
////    var affectedCountries: Double
//
//}
//struct Details: Decodable, Hashable {
//    var country: String
//    var updated: Double
//    var cases: Double
//    var todayCases: Double
//    var deaths: Double
//    var todayDeaths: Double
//    var recovered: Double
//    var active: Double
//    var critical: Double
////
//}
//
//class getData: ObservableObject{
//
//    @Published var data: Cases!
//    @Published var countries = [Details]()
//
//    init(){
//        updateData()
//    }
//
//    func updateData(){
//
//        let url = "https://corona.lmao.ninja/all"
//       // let url1 = "https://corona.lmao.ninja/countries/"
//
//        let session = URLSession(configuration: .default)
//      //  let session1 = URLSession(configuration: .default)
//
//        session.dataTask(with: URL(string: url)!) {(data, _, err) in
//            if err != nil{
//                print((err?.localizedDescription)!)
//                return
//            }
//            let json = try! JSONDecoder().decode(Cases.self, from: data!)
//            DispatchQueue.main.async {
//                self.data = json
//            }
//
//        }.resume()
////        for i in country{
////            session1.dataTask(with: URL(string: url1+i)!) {(data, _, err) in
////                if err != nil{
////                    print((err?.localizedDescription)!)
////                    return
////                }
////                let json = try! JSONDecoder().decode(Details.self, from: data!)
////                DispatchQueue.main.async {
////                    self.countries.append(json)
////                }
////
////            }.resume()
////        }
//
//
//    }
//}
//
//
//var country = ["usa", "italy", "nepal", "china"]
