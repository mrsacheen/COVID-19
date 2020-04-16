//
//  ContentView.swift
//  COVID-19
//
//  Created by Sachin Khanal on 4/6/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        // Text("Hello, World!")
        VStack {
            Main_View()
        }
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
    // var updated: Double
    var cases: Double
    // var todayCases: Double
    var deaths: Double
    // var todayDeaths: Double
    var recovered: Double
    var active: Double
    var critical: Double
    //
}

struct Main_View: View {
    @ObservedObject var data = getData()
    var body: some View {
        VStack(alignment: .leading) {
            NavigationView {
                if self.data.countries.count != 0 && self.data.data != nil {
                    VStack(spacing: 15) {
                        Spacer()
                        HStack {
                            ZStack {
                                VStack(alignment: .center, spacing: 15) {
                                    // ScrollView{
                                    Text("Covid-19 Cases")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color.white)
                                        .opacity(0.5)
                                    Text(getValue(data: self.data.data.cases))
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .opacity(0.5)
                                }.padding()

                            }.background(Color(.red))
                                .cornerRadius(45)
                            ZStack {
                                VStack(alignment: .center, spacing: 15) {
                                    // ScrollView{
                                    Text("Covid-19 Deaths")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color.white)
                                        .opacity(0.5)
                                    Text(getValue(data: self.data.data.deaths))
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .opacity(0.5)
                                }.padding()

                            }.background(Color(.red))
                                .cornerRadius(45)
                        }
                        HStack {
                            ZStack {
                                VStack(alignment: .center, spacing: 15) {
                                    // ScrollView{
                                    Text("Today Cases")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color.white)
                                        .opacity(0.5)
                                    Text(getValue(data: self.data.data.todayCases))
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .opacity(0.5)
                                }.padding()

                            }.background(Color(.red))
                                .cornerRadius(45)
                            ZStack {
                                VStack(alignment: .center, spacing: 15) {
                                    // ScrollView{
                                    Text("Recovered")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color.white)
                                        .opacity(0.5)
                                    Text(getValue(data: self.data.data.recovered))
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .opacity(0.5)
                                }.padding()

                            }.background(Color(.red))
                                .cornerRadius(45)
                        }
                        Spacer()
                        ScrollView(.horizontal){
                            HStack(alignment: .bottom, spacing: 15) {
                                ForEach(self.data.countries, id: \.self) { i in

                                    countryView(data: i)
                                }
                                // }
                            }
                        }
                        
                    }

                    .navigationBarTitle(
                        Text(getDate(time: self.data.data.updated))).foregroundColor(.blue)
                    .navigationBarItems(trailing: Button(action: {
                        self.data.data = nil
                        self.data.countries.removeAll()
                        self.data.updateData()
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.blue)
                            .padding()
                            .font(/*@START_MENU_TOKEN@*/ .largeTitle/*@END_MENU_TOKEN@*/)
                    }.padding(.bottom))
                } else {
                    GeometryReader { _ in
                        VStack {
                            Indicator()
                        }.edgesIgnoringSafeArea(.all)
                    }
                }
            }.navigationViewStyle(StackNavigationViewStyle())
         
        }
        .accentColor(/*@START_MENU_TOKEN@*/ .blue/*@END_MENU_TOKEN@*/)
    }
}

struct Covid19View: View {
    @ObservedObject var data = getData()
    // @State var country: String
    var body: some View {
        VStack {
            if self.data.countries.count != 0 && self.data.data != nil {
                VStack {
                    VStack {
                        HStack(alignment: .center, spacing: 1.0) {
                            // ScrollView {
                            VStack(spacing: 18) {
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
                                self.data.countries.removeAll()
                                self.data.updateData()
                            }) {
                                Image(systemName: "arrow.clockwise")
                                    .foregroundColor(.blue)
                                    .padding()
                                    .font(/*@START_MENU_TOKEN@*/ .largeTitle/*@END_MENU_TOKEN@*/)
                            }.padding(.bottom)
                        }
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .background(Color(.red))
                        .edgesIgnoringSafeArea(.leading)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 600)
                    }
                    // ScrollView{
                    //                         ScrollView{
                    VStack(spacing: 50) {
                        HStack(spacing: 100) {
                            ZStack {
                                Color(.red)
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(25)
                                    .opacity(0.5)
                                VStack {
                                    Text("Deaths")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                    // .opacity(0.5)
                                    Text(getValue(data: self.data.data.deaths))
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                }
                            }
                            ZStack {
                                Color(.red)
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(25)
                                    .opacity(0.5)
                                VStack {
                                    Text("Cases")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                    // .opacity(0.5)
                                    Text(getValue(data: self.data.data.cases))
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                    // .opacity(0.5)
                                }
                            }
                        }

                        HStack(spacing: 100.0) {
                            ZStack {
                                Color(.red)
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(25)
                                    .opacity(0.5)
                                VStack {
                                    Text("Today Cases")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                    // .opacity(0.5)
                                    Text(getValue(data: self.data.data.todayCases))
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                    // .opacity(0.5)
                                }
                            }

                            ZStack {
                                Color(.red)
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(25)
                                    .opacity(0.5)
                                VStack {
                                    Text("Critical")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                    // .opacity(0.5)
                                    Text(getValue(data: self.data.data.critical))
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                    // .opacity(0.5)
                                }
                            }

                            HStack(spacing: 100) {
                                ZStack {
                                    Color(.red)
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(25)
                                        .opacity(0.5)
                                    VStack {
                                        Text("Recovered")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        // .opacity(0.5)
                                        Text(getValue(data: self.data.data.recovered))
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        // .opacity(0.5)
                                    }
                                }

                                ZStack {
                                    Color(.red)
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(25)
                                        .opacity(0.5)
                                    VStack {
                                        Text("Active")
                                            .font(.body)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                            .multilineTextAlignment(.leading)
                                        // .opacity(0.5)
                                        Text(getValue(data: self.data.data.active))
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        // .opacity(0.5)
                                    }
                                }
                            }

                            .frame(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.height - 250)
                        }
                    }
                    // }
                    // ScrollView(.horizontal){
                    HStack(alignment: .bottom, spacing: 15) {
                        ForEach(self.data.countries, id: \.self) { i in

                            countryView(data: i)
                        }
                        // }
                    }
                }
            } else {
                GeometryReader { _ in

                    VStack {
                        Indicator()
                    }.edgesIgnoringSafeArea(.all)
                }
            }
        }.edgesIgnoringSafeArea(.top)
            .background(Color.black.opacity(0.1)).edgesIgnoringSafeArea(.all)
        // NavigationView {
    }
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

struct countryView: View {
    var data: Details
    //    var number : CGFloat = 0
    //    var country = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text(data.country).foregroundColor(Color.black.opacity(0.5))
            HStack {
                Text("Total Cases")
                Text(String(format: "%.0f", getValue(data: data.cases))).foregroundColor(Color.red.opacity(0.5))
            }
            HStack {
                Text("Active Cases")
                Text(String(format: "%.0f", getValue(data: data.active))).foregroundColor(Color.green.opacity(0.5))
            }
            HStack {
                Text("Critical Cases")
                Text(getValue(data: data.critical)).foregroundColor(Color.blue.opacity(0.5))
            }
            HStack {
                Text("Total Deaths")
                Text(String(format: "%.0f", getValue(data: data.deaths))).foregroundColor(Color.gray.opacity(0.5))
            }
            HStack {
                Text("Recovered Cases")
                Text(String(format: "%.0f", getValue(data: data.recovered))).foregroundColor(Color.purple.opacity(0.5))
            }

            //            Rectangle().fill(Color.red).frame(width: UIScreen.main.bounds.width / 7 - 12, height: CGFloat(50 / 10000 * getHeight()))
        }.padding().background(Color(.lightGray))
    }

    func getHeight() -> CGFloat {
        return CGFloat(20 / 1000 * data.cases)
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

class getData: ObservableObject {
    @Published var data: Cases!
    @Published var countries = [Details]()

    init() {
        updateData()
    }

    func updateData() {
        let url = "https://corona.lmao.ninja/all"
        let url1 = "https://corona.lmao.ninja/countries/"

        let session = URLSession(configuration: .default)
        let session1 = URLSession(configuration: .default)

        session.dataTask(with: URL(string: url)!) { data, _, err in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            let json = try! JSONDecoder().decode(Cases.self, from: data!)
            DispatchQueue.main.async {
                self.data = json
            }

        }.resume()
        //        for i in country{
        //            session1.dataTask(with: URL(string: url1+i)!) {(data, _, err) in
        //                if err != nil{
        //                    print((err?.localizedDescription)!)
        //                    return
        //                }
        //                let json = try! JSONDecoder().decode(Details.self, from: data!)
        //                DispatchQueue.main.async {
        //                    self.countries.append(json)
        //                }
        //
        //            }.resume()
        // ForEach(numbers){i in
        //  ForEach(numbers){i in
        for i in country {
            session1.dataTask(with: URL(string: url1 + i)!) { data, _, err in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }
                let json = try! JSONDecoder().decode(Details.self, from: data!)
                DispatchQueue.main.async {
                    self.countries.append(json)
                }

            }.resume()
        }
    }
}

var country = ["usa", "italy", "nepal", "china","USA"]

//struct type: Identifiable {
//    var id: Int
//    var number: CGFloat
//    var country: String
//}
