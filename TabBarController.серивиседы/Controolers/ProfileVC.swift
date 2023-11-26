//
//  ProfileVC.swift
//  TabBarController.серивиседы
//
//  Created by Комаров Дмитрий  on 17.11.2023.
//

import UIKit

class ProfileVC: UIViewController {
    
    var nameLabel = UILabel()
    var lastNameLabel = UILabel()
    var emailLabel = UILabel()
    var addressLabel = UILabel()
    var saveButton = UIButton()
    var changeButton = UIButton()
    
    var nameTF = UITextField()
    var lastNameTF = UITextField()
    var emailTF = UITextField()
    var addressTF = UITextField()
    
    fileprivate func createNameLabel() {
        nameLabel.frame = CGRect(x: 16, y: 172, width: 41, height: 23)
        nameLabel.text = "Имя"
        nameLabel.textColor = UIColor.orange
        nameLabel.font = UIFont.boldSystemFont(ofSize: 19)
        view.addSubview(nameLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        createNameLabel()
        
        lastNameLabel.frame = CGRect(x: 16, y: 236, width: 88, height: 23)
        lastNameLabel.text = "Фамилия"
        lastNameLabel.textColor = UIColor.orange
        lastNameLabel.font = UIFont.boldSystemFont(ofSize: 19)
        view.addSubview(lastNameLabel)
        
        emailLabel.frame = CGRect(x: 16, y: 300, width: 58, height: 23)
        emailLabel.text = "Почта"
        emailLabel.textColor = UIColor.orange
        emailLabel.font = UIFont.boldSystemFont(ofSize: 19)
        view.addSubview(emailLabel)
        
        addressLabel.frame = CGRect(x: 16, y: 364, width: 60, height: 23)
        addressLabel.text = "Адрес"
        addressLabel.textColor = UIColor.orange
        addressLabel.font = UIFont.boldSystemFont(ofSize: 19)
        view.addSubview(addressLabel)
        
        saveButton.frame = CGRect(x: 16, y: 730, width: 177, height: 35)
        saveButton.layer.cornerRadius = 10
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = UIColor.orange
        view.addSubview(saveButton)
        
        changeButton.frame = CGRect(x: 200, y: 730, width: 177, height: 35)
        changeButton.layer.cornerRadius = 10
        changeButton.setTitle("Изменить", for: .normal)
        changeButton.setTitleColor(.white, for: .normal)
        changeButton.backgroundColor = UIColor.orange
        view.addSubview(changeButton)
        
        nameTF.frame = CGRect(x: 112, y: 167, width: 265, height: 34)
        nameTF.placeholder = "Введите ваше имя"
        nameTF.layer.borderColor = UIColor.orange.cgColor
        nameTF.layer.borderWidth = 1.0
        nameTF.layer.cornerRadius = 5.0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray, // Цвет текста плейсхолдера
            .paragraphStyle: paragraphStyle
        ]
        nameTF.attributedPlaceholder = NSAttributedString(string: "Введите ваше имя", attributes: attributes)
        
        view.addSubview(nameTF)
        
        
        lastNameTF.frame = CGRect(x: 112, y: 231, width: 265, height: 34)
        lastNameTF.placeholder = "Введите свою фамилию"
        lastNameTF.layer.borderColor = UIColor.orange.cgColor
        lastNameTF.layer.borderWidth = 1.0
        lastNameTF.layer.cornerRadius = 5.0
        lastNameTF.contentVerticalAlignment = .center
        lastNameTF.contentHorizontalAlignment = .center
        lastNameTF.attributedPlaceholder = NSAttributedString(string: "Введите свою фамилию", attributes: attributes)
        view.addSubview(lastNameTF)
        
        emailTF.frame = CGRect(x: 112, y: 295, width: 265, height: 34)
        emailTF.placeholder = "Введите свою почту"
        emailTF.layer.borderColor = UIColor.orange.cgColor
        emailTF.layer.borderWidth = 1.0
        emailTF.layer.cornerRadius = 5.0
        emailTF.contentVerticalAlignment = .center
        emailTF.contentHorizontalAlignment = .center
        emailTF.attributedPlaceholder = NSAttributedString(string: "Введите свою почту", attributes: attributes)
        view.addSubview(emailTF)
        
        addressTF.frame = CGRect(x: 112, y: 359, width: 265, height: 34)
        addressTF.placeholder = "Введите свой адрес"
        addressTF.layer.borderColor = UIColor.orange.cgColor
        addressTF.layer.borderWidth = 1.0
        addressTF.layer.cornerRadius = 5.0
        addressTF.contentVerticalAlignment = .center
        addressTF.contentHorizontalAlignment = .center
        addressTF.attributedPlaceholder = NSAttributedString(string: "Введите свой адрес", attributes: attributes)
        view.addSubview(addressTF)
        
        
    }
    
    
}
