//
//  ViewController.swift
//  FilmLocations
//
//  Created by Bo on 4/13/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var films:[FilmEntryCodable] = []
    
    let tableView = UITableView()
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getDataFromFile("locations")
        setupTableView()
    }

//    func getDataFromFile(_ fileName:String){
//        let path = Bundle.main.path(forResource: fileName, ofType: ".json")
//        if let path = path {
//          let url = URL(fileURLWithPath: path)
//          print(url)
//            let contents = try? Data(contentsOf: url)
//            do {
//              if let data = contents,
//              let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String:Any]] {
//                print(jsonResult)
//
//                for film in jsonResult{
//                    let firstActor = film["actor_1"] as? String ?? ""
//                    let locations = film["locations"] as? String  ?? ""
//                    let releaseYear = film["release_year"] as? String  ?? ""
//                    let title = film["title"] as? String  ?? ""
//                    let movie = FilmEntry(firstActor: firstActor, locations: locations, releaseYear: releaseYear, title: title)
//                    films.append(movie)
//                }
//                tableView.reloadData()
//              }
//            } catch {
//              print("Error deserializing JSON: \(error)")
//            }
//        }
//    }
    
    
    // V2 with codable protocol
    func getDataFromFile(_ fileName:String){
        let path = Bundle.main.path(forResource: fileName, ofType: ".json")
        if let path = path {
            let url = URL(fileURLWithPath: path)
            let contents = try? Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            if let data = contents{
                let decoder = JSONDecoder()
                do {
                    let filmsFromJSON = try decoder.decode([FilmEntryCodable].self, from: data)
                    films = filmsFromJSON
                    tableView.reloadData()
                } catch {
                    print("Parsing Failed")
                }
            }
        }
    }
    
    func setupTableView() {
      view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        getDataFromFile("locations")
    }
    
    

}



extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return films.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    let movie = films[indexPath.row]
    cell.textLabel?.text = movie.locations
    cell.textLabel?.text = movie.locations + " " + movie.releaseYear.value
    return cell
  }
}
