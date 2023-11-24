//
//  DetailCellViewController.swift
//  TabBarController.серивиседы
//
//  Created by Комаров Дмитрий  on 24.11.2023.
//

import UIKit

class DetailCellViewController: UIViewController {
    var food: Food?
    
    var imageFood = UIImageView()
    var nameLabbel = UILabel()
    var descriptionSegmentLabel = UILabel()
    var descriptionLabel = UILabel()
    var sizeSegmentControl = UISegmentedControl()
    let sizeArray = ["Маленькая", "Средняя", "Большая"]
    var doughSegmentControl = UISegmentedControl()
    let doughArray = ["Традиционное", "Тонкое"]
    let sizePizza = [25, 30, 35]
    let weightPizza = [310, 470, 640]
    
    var buyButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        createNameLabel()
        createDescriptionLabel()
        createSizeSegmentControl()
        createDoughSegmentControl()
        createImageFood()
        createBuyButton()
        createDescriptionSegmentLabel()
        
        if let food = food {
            nameLabbel.text = food.name
            descriptionLabel.text = food.description
            imageFood.image = food.imageFood
            buyButton.setTitle("В корзину за \(food.cost) р", for: .normal)
        }
        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: #selector(backToMenuVC))
        barButtonItem.tintColor = UIColor.orange
        self.navigationItem.leftBarButtonItem = barButtonItem
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Скрываем таб-бар при возвращении на экран MenuVC
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Восстанавливаем видимость таб-бара перед выходом
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @objc func backToMenuVC() {
            // Возвращаемся к контроллеру MenuVC
            self.navigationController?.popViewController(animated: true)
        }
    
    
    fileprivate func createNameLabel() {
        view.addSubview(nameLabbel)
        nameLabbel.frame = CGRect(x: 16, y: 460, width: 361, height: 21)
        nameLabbel.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    fileprivate func createDescriptionSegmentLabel() {
        descriptionSegmentLabel.frame = CGRect(x: 16, y: 489, width: 361, height: 21)
        view.addSubview(descriptionSegmentLabel)
        descriptionSegmentLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionSegmentLabel.textColor = UIColor(named: "Dark Gray Color")
        descriptionSegmentLabel.text = "\(sizeArray[1]) \(sizePizza[1]) см, \(doughArray[0]) тесто, \(weightPizza[1]) г"
        descriptionSegmentLabel.adjustsFontSizeToFitWidth = true
        descriptionSegmentLabel.minimumScaleFactor = 0.7
    }
    
    fileprivate func createDescriptionLabel() {
        view.addSubview(descriptionLabel)
        descriptionLabel.frame = CGRect(x: 16, y: 518, width: 361, height: 72)
        descriptionLabel.font = UIFont.systemFont(ofSize: 17)
        descriptionLabel.numberOfLines = 0 // Устанавливаем количество строк на 0, чтобы текст переносился на новую строку
        descriptionLabel.lineBreakMode = .byWordWrapping // Устанавливаем режим переноса по словам
    }
    
    
    fileprivate func createSizeSegmentControl() {
        sizeSegmentControl = UISegmentedControl(items: sizeArray)
        view.addSubview(sizeSegmentControl)
        sizeSegmentControl.frame = CGRect(x: 16, y: 598, width: 361, height: 40)
        // Устанавливаем атрибуты текста для сегментов
        let boldFontAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        ]
        sizeSegmentControl.setTitleTextAttributes(boldFontAttributes, for: .normal)
        sizeSegmentControl.selectedSegmentIndex = 1
        
        sizeSegmentControl.addTarget(self, action: #selector(changeSizeSegmentControl(target:)), for: .valueChanged)
        
    }
    
    @objc private func changeSizeSegmentControl(target: UISegmentedControl) {
        if target == self.sizeSegmentControl {
            updateDescriptionLabel()
            
            if target.selectedSegmentIndex == 0 {
                doughSegmentControl.selectedSegmentIndex = 0
                updateDescriptionLabel() // Обновите описание после изменения doughSegmentControl
            }
            
            doughSegmentControl.setEnabled(target.selectedSegmentIndex != 0, forSegmentAt: 1)
        }
    }
    
    fileprivate func createDoughSegmentControl() {
        doughSegmentControl = UISegmentedControl(items: doughArray)
        view.addSubview(doughSegmentControl)
        doughSegmentControl.frame = CGRect(x: 16, y: 645, width: 361, height: 40)
        
        let boldFontAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        ]
        doughSegmentControl.setTitleTextAttributes(boldFontAttributes, for: .normal)
        doughSegmentControl.selectedSegmentIndex = 0
        
        doughSegmentControl.addTarget(self, action: #selector(changeDoughSegmentControl(target:)), for: .valueChanged)
        
    }
    
    @objc private func changeDoughSegmentControl(target: UISegmentedControl) {
        if target == self.doughSegmentControl {
            updateDescriptionLabel()
        }
    }
    
    
    
    fileprivate func createImageFood() {
        view.addSubview(imageFood)
        imageFood.frame = CGRect(x: 16, y: 59, width: 361, height: 361)
        imageFood.contentMode = .scaleAspectFit
        
    }
    
    fileprivate func createBuyButton() {
        // Создаем кнопку
        buyButton.layer.cornerRadius = 10
        buyButton.backgroundColor = UIColor.orange // Устанавливаем цвет фона кнопки
        buyButton.setTitleColor(UIColor.white, for: .normal) // Устанавливаем цвет текста кнопки
        buyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        
        
        // Устанавливаем фрейм кнопки
        buyButton.frame = CGRect(x: 16, y: 773, width: 361, height: 45)
        buyButton.alpha = 1.0
        
        // Добавляем кнопку к представлению
        view.addSubview(buyButton)
    }
    
    
    private func updateDescriptionLabel() {
        
        let sizeIndex = sizeSegmentControl.selectedSegmentIndex
        let doughIndex = doughSegmentControl.selectedSegmentIndex
        
        let sizeDescription = "\(sizeArray[sizeIndex]) \(sizePizza[sizeIndex]) см"
        let doughDescription = "\(doughArray[doughIndex]) тесто"
        let weightDescription = "\(weightPizza[sizeIndex] - (doughIndex == 1 ? 110 : 0)) г"
        
        descriptionSegmentLabel.text = "\(sizeDescription), \(doughDescription), \(weightDescription)"
    }
    
    
}
