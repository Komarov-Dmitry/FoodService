import UIKit

class FoodTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var descriptionTextView = UITextView()
    var costButton = UIButton()
    var imageFoodView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createCostButton()
        createNameLabel()
        createDescriptionTextView()
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

        // Конфигурация вида для выбранной ячейки
    }
    
    func refresh(_ model: Food) {
        print("Обновление ячейки данными: \(model)")
        nameLabel.text = model.name
        descriptionTextView.text = model.description
        costButton.setTitle("от \(model.cost) р", for: .normal)
        imageFoodView.image = UIImage(named: "cheesePizza")
    }
    
    func createNameLabel() {
        print("Создание метки с именем")
        nameLabel.text = ""
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        contentView.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 188, y: 12, width: 185, height: 42)
    }
    
    func createDescriptionTextView() {
        print("Создание текстового вида для описания")
        descriptionTextView.text = ""
        descriptionTextView.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(descriptionTextView)
        descriptionTextView.frame = CGRect(x: 188, y: 62, width: 185, height: 61)
    }
    
    func createCostButton() {
        print("Создание кнопки для стоимости")
        
        contentView.addSubview(costButton)
        costButton.frame = CGRect(x: 188, y: 137, width: 92, height: 35)
    
        costButton.backgroundColor = UIColor.orange.withAlphaComponent(0.3)
        
        costButton.layer.cornerRadius = 10
        
        costButton.setTitleColor(UIColor.orange, for: .normal)
        
        costButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        costButton.setTitle("", for: .normal)
    }


    
    func createImageFoodView() {
        print("Создание изображения блюда")
        contentView.addSubview(imageFoodView)
        imageFoodView.frame = CGRect(x: 20, y: 12, width: 160, height: 160)
    }
}
