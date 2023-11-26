import UIKit



class MenuVC: UIViewController {
    
    var didFoodAdded: ((Food) -> Void)?
    
    var menuTableView = UITableView()
    var foodArray = [Food]()
    let identifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        createMenuTableView()
        
        fillingArray(name: "Сырная", description: "Моцарелла, сыры чеддер и пармезан, фирменный соус альфредо", image: UIImage(named: "cheesePizza") ?? UIImage(), cost: 299)
        
        fillingArray(name: "Двойной Цыпленок", description: "Цыпленок, моцарелла, фирменный соус альфредо", image: UIImage(named: "chickPizza") ?? UIImage(), cost: 409)
        
        fillingArray(name: "Пепперони", description: "Пикантная пепперони, моцарелла, томаты, фирменный томатный соус", image: UIImage(named: "pepperoniPizza") ?? UIImage(), cost: 299)
        
        fillingArray(name: "Ветчина и сыр", description: "Ветчина, моцарелла, фирменный соус альфредо", image: UIImage(named: "hamAndCheese") ?? UIImage(), cost: 409)
        
        fillingArray(name: "Микс", description: "Бекон, цыпленок, ветчина, сыр, томаты, лук, соус песто, соус альфредо", image: UIImage(named: "mixPizza") ?? UIImage(), cost: 539)
        
        
        
    }
    
    private func fillingArray(name: String, description: String, image: UIImage, cost: Int) {
        let item = Food(name: name, description: description, imageFood: image, cost: cost)
        foodArray.append(item)
    }
    
    private func createMenuTableView() {
        menuTableView.register(FoodTableViewCell.self, forCellReuseIdentifier: identifier)
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.frame = CGRect(x: 0, y: 59, width: 393, height: 710)
        menuTableView.separatorStyle = .none  // Убираем разделительные линии
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFood = foodArray[indexPath.row]
        showDetailViewController(for: selectedFood)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 186.0
    }
    

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            // Сбрасываем подсветку при повторном отображении ячейки
            cell.selectionStyle = .none
        }
    
    func showDetailViewController(for food: Food) {
       
        let detailVC = DetailCellViewController()
        
        detailVC.food = food // Передаем данные в новый ViewController
        detailVC.didFoodAdded = didFoodAdded
        self.hidesBottomBarWhenPushed = true // Скрываем таббар при переходе
        self.navigationController?.pushViewController(detailVC, animated: true)
        self.hidesBottomBarWhenPushed = false // Восстанавливаем обычное поведение таббара
    }
}

