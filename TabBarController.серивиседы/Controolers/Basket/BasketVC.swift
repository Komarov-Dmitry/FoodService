
import UIKit

class BasketVC: UIViewController {
    var food: Food?
    var basketTableView = UITableView()
    let identifierBaskket = "basketCell"
    var totalPriceButton = UIButton()
    
    var basketArray = [Food]()
    
    fileprivate func createTotalPriceButton() {
        print("createTotalPriceButton")
        totalPriceButton.frame = CGRect(x: 16, y :734, width: 361, height: 35)
        totalPriceButton.layer.cornerRadius = 10
        totalPriceButton.backgroundColor = UIColor.orange
        totalPriceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        totalPriceButton.setTitleColor(UIColor.white, for: .normal)
        
        view.addSubview(totalPriceButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        createBasketTableView()
        
        createTotalPriceButton()
        
    }
    
    private func createBasketTableView() {
        basketTableView.register(BasketTableViewCell.self, forCellReuseIdentifier: identifierBaskket)
        
        basketTableView.dataSource = self
        basketTableView.delegate = self
        basketTableView.frame = CGRect(x: 0, y: 59, width: 393, height: 667)
        view.addSubview(basketTableView)
    }
    
    func addProductToBasket(_ food: Food) {
        basketArray.append(food)
        totalPriceButton.isHidden = false
        updateTotalPriceButton()
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.basketTableView.reloadData()
        }
    }
    
    
    private func updateTotalPriceButton() {
        
        let totalSum = self.totalSum(array: self.basketArray)
        totalPriceButton.setTitle("Оплатить \(totalSum) р", for: .normal)
        totalPriceButton.isHidden = false
    }
    
    private func totalSum(array: [Food]) -> Int {
        var sum = 0
        for item in array {
            sum  = sum + (item.currentPrice * item.count)
        }
        return sum
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
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144.0
    }
    
    
}

extension BasketVC: BasketTableViewCellDelegate {
    func stepperValueChanged(for cell: BasketTableViewCell, count: Int) {
        guard let indexPath = basketTableView.indexPath(for: cell) else { return }
        var updatedFood = basketArray[indexPath.row]
        updatedFood.count = count
        basketArray[indexPath.row] = updatedFood
        updateTotalPriceButton()
    }
}
