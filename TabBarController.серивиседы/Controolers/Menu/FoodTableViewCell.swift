import UIKit

class FoodTableViewCell: UITableViewCell {
    
    private var nameLabel = UILabel()
    private var descriptionLabel = UILabel() // Обновленное имя переменной
    private var costButton = UIButton()
    private var imageFoodView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createCostButton()
        createNameLabel()
        createDescriptionLabel() // Обновленный вызов функции
        createImageFoodView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Код инициализации
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.contentView.backgroundColor = UIColor.clear
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        if highlighted {
            self.contentView.backgroundColor = UIColor.clear
        }
    }
    
    func refresh(_ model: Food) {
        print("Обновление ячейки данными: \(model)")
        nameLabel.text = model.name
        descriptionLabel.text = model.description
        costButton.setTitle("от \(model.cost) р", for: .normal)
        imageFoodView.image = model.imageFood
    }
    
    private func createNameLabel() {
        print("Создание метки с именем")
        nameLabel.text = ""
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        contentView.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 188, y: 12, width: 185, height: 42)
    }
    
    private func createDescriptionLabel() {
        print("Создание метки для описания")
        descriptionLabel.text = ""
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0 // Позволяет использовать несколько строк
        contentView.addSubview(descriptionLabel)
        descriptionLabel.frame = CGRect(x: 188, y: 62, width: 185, height: 61)
        
        // Добавлены ограничения для многострочной метки
        descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 61).isActive = true
    }
    
    private func createCostButton() {
        print("Создание кнопки для стоимости")
        
        contentView.addSubview(costButton)
        costButton.frame = CGRect(x: 188, y: 137, width: 92, height: 35)
        costButton.backgroundColor = UIColor.orange.withAlphaComponent(0.3)
        costButton.layer.cornerRadius = 10
        costButton.setTitleColor(UIColor.orange, for: .normal)
        costButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        costButton.setTitle("", for: .normal)
        
        costButton.addTarget(self, action: #selector(showDetailVC(target:)), for: .touchUpInside)
    }
    
    @objc private func showDetailVC(target: UIButton) {
        if let viewController = self.findViewController() as? MenuVC, let indexPath = viewController.menuTableView.indexPath(for: self) {
            let selectedFood = viewController.foodArray[indexPath.row]
            viewController.showDetailViewController(for: selectedFood)
        }
    }
    
    
    private func createImageFoodView() {
        print("Создание изображения блюда")
        
        contentView.addSubview(imageFoodView)
        
        imageFoodView.contentMode = .scaleAspectFill
        imageFoodView.clipsToBounds = true
        
        imageFoodView.frame = CGRect(x: 20, y: 12, width: 160, height: 160)
    }
}

extension UIView {
    func findViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while let currentResponder = responder {
            if let viewController = currentResponder as? UIViewController {
                return viewController
            }
            responder = currentResponder.next
        }
        return nil
    }
}
