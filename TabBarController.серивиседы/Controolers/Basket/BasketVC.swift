
import UIKit

class BasketVC: UIViewController {
    var food: Food?
    var basketTableView = UITableView()
    let identifierBaskket = "basketCell"
    
    var basketArray = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        createBasketTableView()
        
    }
    
    private func createBasketTableView() {
        basketTableView.register(BasketTableViewCell.self, forCellReuseIdentifier: identifierBaskket)
        
        basketTableView.dataSource = self
        basketTableView.delegate = self
        basketTableView.frame = CGRect(x: 0, y: 59, width: 393, height: 710)
        view.addSubview(basketTableView)
    }
    
    func addProductToBasket(_ food: Food) {
        print("addProductToBasket")
        basketArray.append(food)
        print(basketArray)
        basketTableView.reloadData()
    }
}

extension BasketVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return basketArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifierBaskket, for: indexPath) as? BasketTableViewCell else {
            return UITableViewCell()
        }
        
        let item = basketArray[indexPath.row]
       
        cell.foodItem = item  // Установите выбранный элемент Food в ячейку
        cell.refreshBasketCell()
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144.0
    }
    
    
}

