import UIKit

struct Item {
    let title: String
    let imageName: String
}

class TableViewController: UITableViewController {
    let items: [Item] = [
        Item(title: "Banana", imageName: "Banana"),
        Item(title: "Orange", imageName: "Orange"),
        Item(title: "Apple", imageName: "Apple"),
        Item(title: "Strawberry", imageName: "Strawberry")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Table"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.imageView?.image = UIImage(named: item.imageName)
        
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cell.imageView!.widthAnchor.constraint(equalToConstant: 60),
            cell.imageView!.heightAnchor.constraint(equalToConstant: 60),
            cell.imageView!.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 10),
            cell.imageView!.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
        ])
        
        cell.textLabel?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cell.textLabel!.leadingAnchor.constraint(equalTo: cell.imageView!.trailingAnchor, constant: 10),
            cell.textLabel!.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -10),
            cell.textLabel!.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
        ])
        
        return cell
    }
}
