import UIKit

class BasketTableViewCell: UITableViewCell {
    
    var foodItem: Food?
   
    var imageFood = UIImageView()
    var nameLabel = UILabel()
    var descriptionSegmenLabel = UILabel()
    var costLabel = UILabel()
    var countStepper = UIStepper()
    var countLAbel = UILabel()
    var countPizza = 1
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createImageFoodBasket()
        createNameLabelBasket()
        createDescriptionSegmenLabelBasket()
        createCostLabelBasket()
        createCountStepper()
        createCountLAbel()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
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
    
    fileprivate func createImageFoodBasket() {
        imageFood.frame = CGRect(x: 20, y: 11, width: 93, height: 93)
        imageFood.contentMode = .scaleAspectFit
        contentView.addSubview(imageFood)
    }
    
    fileprivate func createCountLAbel() {
        countLAbel.frame = CGRect(x: 229, y: 101, width: 42, height: 32)
        countLAbel.font = UIFont.boldSystemFont(ofSize: 20)
        countLAbel.text = "\(countPizza)"
        countLAbel.baselineAdjustment = .alignCenters
        contentView.addSubview(countLAbel)
    }
    
    fileprivate func createNameLabelBasket() {
        nameLabel.frame = CGRect(x: 121, y: 11, width: 252, height: 21)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 19)
        contentView.addSubview(nameLabel)
    }
    
    fileprivate func createDescriptionSegmenLabelBasket() {
        descriptionSegmenLabel.frame = CGRect(x: 121, y: 40, width: 252, height: 53)
        descriptionSegmenLabel.textColor = UIColor(named: "Dark Gray Color")
        descriptionSegmenLabel.font = UIFont.systemFont(ofSize: 17)
        descriptionSegmenLabel.numberOfLines = 0
        descriptionSegmenLabel.minimumScaleFactor = 0.5
        contentView.addSubview(descriptionSegmenLabel)
    }

    
    fileprivate func createCostLabelBasket() {
        costLabel.frame = CGRect(x: 20, y: 112, width: 75, height: 21)
        costLabel.font = UIFont.boldSystemFont(ofSize: 17)
        contentView.addSubview(costLabel)
    }
    
    fileprivate func createCountStepper() {
        countStepper.frame = CGRect(x: 279, y: 101, width: 94, height: 32)
        countStepper.minimumValue = 1
        countStepper.maximumValue = 10
        countStepper.value = 1
        contentView.addSubview(countStepper)
        countStepper.addTarget(self, action: #selector(changeStepper(target: )), for: .touchUpInside)
    }
    
    @objc private func changeStepper(target: UIStepper) {
        countPizza = Int(target.value)
        countLAbel.text = "\(countPizza)"
    }
    
    func refreshBasketCell() {
        guard let model = foodItem else {
            return
        }
        nameLabel.text = model.name
        imageFood.image = model.imageFood
        costLabel.text = "\(model.cost) р"
        countLAbel.text = "\(model.count)"
        descriptionSegmenLabel.text = model.description
      
    }
    
}
