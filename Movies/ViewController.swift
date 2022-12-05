//
//  ViewController.swift
//  Movies
//
//  Created by Kovács Márk on 2022. 11. 12..
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movies: [Movie] = []
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var movie = Movie("Movie title", 2021, "")
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        cell.textLabel?.text = "\(movies[indexPath.row].title)"
        cell.detailTextLabel?.text = "\(movies[indexPath.row].year)"
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = "🎬".image()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        alert(movies[indexPath.row].title, "\(movies[indexPath.row].year)")
    }
    
    //ez már nem lesz a ZH-ban
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, handler in
            self.movies.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        return config
    }
    
    func alert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addMovie()
    }
    
    func addMovie() {
        movies.append(Movie("Terrifier 2", 2022, ""))
        movies.append(Movie("Black Adam", 2022, ""))
        movies.append(Movie("MexZombies", 2022, ""))
        movies.append(Movie("Nyugaton a helyzet változatlan", 2022, ""))
        movies.append(Movie("Fekete Párduc 2.", 2022, ""))
        movies.append(Movie("Enola Holmes 2.", 2022, ""))
        movies.append(Movie("Blade of the 47 Ronin", 2022, ""))
        movies.append(Movie("Fall", 2022, ""))
        movies.append(Movie("Top Gun: Maverick", 2022, ""))
        movies.append(Movie("Bohócrém", 2022, ""))
    }
}

extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 40, height: 40)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.white.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(rect)
        (self as AnyObject).draw(in: rect, withAttributes: [.font:
        UIFont.systemFont(ofSize: 40)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

