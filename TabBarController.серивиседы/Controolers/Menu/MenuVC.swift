import UIKit

class MenuVC: UIViewController {

    var menuTableView = UITableView()
    var foodArray = [Food]()
    let identifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        createMenuTableView()

        let item = Food(name: "Сырная",
                        description: "Моцарелла, сыры чеддер и пармезан, фирменный соус альфредо",
                        imageData: UIImage(named: "cheesePizza")?.pngData(),
                        cost: 299)
        foodArray.append(item)
    }

    func createMenuTableView() {
        menuTableView.register(FoodTableViewCell.self, forCellReuseIdentifier: identifier)

        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.frame = CGRect(x: 0, y: 59, width: 393, height: 710)
        view.addSubview(menuTableView)
        
    }
}

extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? FoodTableViewCell else {return UITableViewCell()}

            let item = foodArray[indexPath.row]
            cell.refresh(item)
            print("Cell data: \(item)")
            return cell
        
        
    }
    
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 186.0
    }
}
