//
//  ContentView.swift
//  COVID-19
//
//  Created by Sachin Khanal on 4/6/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI
import Foundation

struct ContentView: View {
    var body: some View {
        // Text("Hello, World!")
        Covid19View()
    }
}

struct Covid19View: View {
    @ObservedObject var data = getData()
    // @State var country: String
    var body: some View {
        VStack{
            if self.data.countries.count != 0 && self.data.data != nil {
                ScrollView{
                    VStack{
                        
                        VStack {
                            HStack(alignment: .center, spacing: 1.0) {
                                // ScrollView {
                                VStack(alignment: .leading, spacing: 18) {
                                    Spacer()
                                    Text(getDate(time: self.data.data.updated))
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .opacity(0.5)
                                    Text("Covid-19 Cases")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .opacity(0.5)
                                    Text(getValue(data: self.data.data.cases))
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .opacity(0.5)
                                }
                                .frame(height: 225)
                                Spacer()
                                Button(action: {
                                    self.data.data = nil
                                    self.data.updateData()
                                }) {
                                    Image(systemName: "arrow.clockwise")
                                        .foregroundColor(.blue)
                                        .padding()
                                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                                }.padding(.bottom)
                            }
                            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                            .background(Color(.red))
                            .edgesIgnoringSafeArea(.leading)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-600)
                        }
                        // ScrollView{
                        VStack(spacing: 50){
                            HStack(spacing: 100){
                                ZStack{
                                    Color(.red)
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(25)
                                        .opacity(0.5)
                                    VStack{
                                        
                                        Text("Deaths")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        //.opacity(0.5)
                                        Text(getValue(data: self.data.data.deaths))
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                    }
                                }
                                ZStack{
                                    Color(.red)
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(25)
                                        .opacity(0.5)
                                    VStack{
                                        
                                        Text("Cases")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        //.opacity(0.5)
                                        Text(getValue(data: self.data.data.cases))
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        //.opacity(0.5)
                                        
                                    }
                                }
                            }
                            
                            HStack(spacing: 100.0){
                                ZStack{
                                    Color(.red)
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(25)
                                        .opacity(0.5)
                                    VStack{
                                        
                                        Text("Today Cases")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        //.opacity(0.5)
                                        Text(getValue(data: self.data.data.todayCases))
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        //.opacity(0.5)
                                        
                                    }
                                }
                                
                                ZStack{
                                    Color(.red)
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(25)
                                        .opacity(0.5)
                                    VStack{
                                        
                                        Text("Critical")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        //.opacity(0.5)
                                        Text(getValue(data: self.data.data.critical))
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        //.opacity(0.5)
                                        
                                    }
                                    
                                }
                                
                                
                                HStack(spacing: 100){
                                    ZStack{
                                        Color(.red)
                                            .frame(width: 150, height: 150)
                                            .cornerRadius(25)
                                            .opacity(0.5)
                                        VStack{
                                            
                                            Text("Recovered")
                                                .font(.largeTitle)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                            //.opacity(0.5)
                                            Text(getValue(data: self.data.data.recovered))
                                                .font(.largeTitle)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                            //.opacity(0.5)
                                            
                                        }
                                    }
                                    
                                    ZStack{
                                        Color(.red)
                                            .frame(width: 150, height: 150)
                                            .cornerRadius(25)
                                            .opacity(0.5)
                                        VStack{
                                            
                                            Text("Active")
                                                .font(.body)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                                .multilineTextAlignment(.leading)
                                            //.opacity(0.5)
                                            Text(getValue(data: self.data.data.active))
                                                .font(.largeTitle)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                            //.opacity(0.5)
                                            
                                        }
                                        
                                        
                                    }
                                }
                                    
                                .frame(width: UIScreen.main.bounds.width-10, height: UIScreen.main.bounds.height-250)
                                
                            }
                            
                            
                        }
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(alignment: .bottom, spacing: 8){
                                
                                ForEach(numbers){i in
                                    
                                    
                                    countryView(number: i.number,country: i.country)
                                }
                            }.frame(height: 250)
                        }
                        
                    }
                }
                
            }
            else {
                GeometryReader{_ in
                    
                    VStack {
                        Indicator()
                    }.edgesIgnoringSafeArea(.all)
                    
                }
            }
        }.edgesIgnoringSafeArea(.top)
            .background(Color.black.opacity(0.1)).edgesIgnoringSafeArea(.all)
        // NavigationView {
        
    }
    
    func getDate(time: Double) -> String {
        let date = Double(time / 1000)
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MM - dd - YYYY "
        
        return formatter.string(from: Date(timeIntervalSinceNow: TimeInterval(exactly: date)!))
    }
    
    func getValue(data: Double) -> String {
        let format = NumberFormatter()
        
        format.numberStyle = .decimal
        
        return format.string(for: data)!
    }
}

struct countryView: View{
    var number : CGFloat = 0
    var country = ""
    
    var body : some View{
        
        VStack{
            
            Text(String(format: "%.0f", Double(number)) + "%").foregroundColor(Color.black.opacity(0.5))
            
            Rectangle().fill(Color.red).frame(width: UIScreen.main.bounds.width / 7 - 12, height: getHeight())
            
            Text(country).foregroundColor(Color.black.opacity(0.5))
        }
        
    }
    
    func getHeight()->CGFloat{
        
        return 20 / 10000000 * number
    }
}

struct Indicator: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Cases: Decodable {
    
    var cases: Double
    var todayCases: Double
    var deaths: Double
    var todayDeaths: Double
    var updated: Double
    var recovered: Double
    var active: Double
    var critical: Double
}
struct Details: Decodable, Hashable {
    var country: String
    var updated: Double
    var cases: Double
    var todayCases: Double
    var deaths: Double
    var todayDeaths: Double
    var recovered: Double
    var active: Double
    var critical: Double
    //
}

class getData: ObservableObject{
    
    @Published var data: Cases!
    @Published var countries = [Details]()
    
    
    init(){
        updateData()
    }
    
    func updateData(){
        
        let url = "https://corona.lmao.ninja/all"
        let url1 = "https://corona.lmao.ninja/countries/"
        
        let session = URLSession(configuration: .default)
        let session1 = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) {(data, _, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            let json = try! JSONDecoder().decode(Cases.self, from: data!)
            DispatchQueue.main.async {
                self.data = json
            }
            
        }.resume()
        for i in country{
            session1.dataTask(with: URL(string: url1+i)!) {(data, _, err) in
                if err != nil{
                    print((err?.localizedDescription)!)
                    return
                }
                let json = try! JSONDecoder().decode(Details.self, from: data!)
                DispatchQueue.main.async {
                    self.countries.append(json)
                }
                
            }.resume()
            //        ForEach(country, id: \.country){i in
            //        session1.dataTask(with: URL(string: url1+i)!) {(data, _, err) in
            //            if err != nil{
            //                print((err?.localizedDescription)!)
            //                return
            //            }
            //            let json = try! JSONDecoder().decode(Details.self, from: data!)
            //            DispatchQueue.main.async {
            //                self.countries.append(json)
            //            }
            //
            //        }.resume()
        }
        
        
    }
}


var country = ["usa", "italy", "nepal", "china"]

struct type: Identifiable{
    var id: Int
    var number: CGFloat
    var country: String
}
var numbers = [
    type(id: 0, number: 1056560, country: "usa"),
    type(id: 1, number: 454546, country: "italy"),
    type(id: 2, number: 2346456, country: "china"),
    type(id: 3, number: 1645647, country: "spain"),
    type(id: 4, number: 64564569, country: "UK"),
    type(id: 5, number: 74645648, country: "Belgium"),
    type(id: 6, number: 546566, country: "Nepal"),
    type(id: 7, number: 2466468, country: "HongKong"),
    type(id: 8, number: 9456469, country: "Russia")
]
