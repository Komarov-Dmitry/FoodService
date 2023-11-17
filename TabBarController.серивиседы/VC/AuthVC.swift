//
//  AuthVC.swift
//  TabBarController.серивиседы
//
//  Created by Комаров Дмитрий  on 17.11.2023.
//

import UIKit

class AuthVC: UIViewController {
    
    var registration = UILabel()
    var loginButton = UIButton()
    var registrationButton = UIButton()
    var emailTF = UITextField()
    var passwordTF = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        createRegistrationLabel()
        createLoginButton()
        createRegistrationButton()
        
    }
    
    
    //MARK: - Таргет на кнопку Авторизоваться
    @objc private func authButtonTapped() {
            // После нажатия кнопки "Авторизация" меняем rootViewController на tabBarVC
            if let window = UIApplication.shared.windows.first, let sceneDelegate = window.windowScene?.delegate as? SceneDelegate {
                let tabBarVC = createTabBarController()
                sceneDelegate.window?.rootViewController = tabBarVC
                sceneDelegate.window?.makeKeyAndVisible()
            }
        }
    
    //MARK: - Создание createTabBarController()
    private func createTabBarController() -> UITabBarController {
            let menuVC = MenuVC()
            menuVC.tabBarItem = UITabBarItem(title: "Меню", image: UIImage(systemName: "fork.knife"), tag: 0)

            let profileVC = ProfileVC()
            profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 1)
            
            let basketVC = BasketVC()
            basketVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "basket"), tag: 2)
            
            let basketNavigationController = UINavigationController(rootViewController: basketVC)
            
            let tabBarVC = UITabBarController()
            tabBarVC.setViewControllers([menuVC, profileVC, basketNavigationController], animated: true)

            tabBarVC.tabBar.tintColor = UIColor.orange
            tabBarVC.tabBar.shadowImage = UIImage()
            tabBarVC.tabBar.backgroundImage = UIImage()
            
            // Добавление линии под таб-баром
            let lineView = UIView(frame: CGRect(x: 0, y: 0, width: tabBarVC.tabBar.frame.width, height: 1))
            lineView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            tabBarVC.tabBar.addSubview(lineView)
            
            return tabBarVC
        }
    
    //MARK: - Создание LabelRegister
    fileprivate func createRegistrationLabel() {
        self.registration.text = "ФудФорс"
        self.registration.frame = CGRect(x: 16, y: 239, width: 361, height: 48)
        self.registration.textColor = UIColor.orange
        self.registration.shadowColor = UIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1.0)
        self.registration.shadowOffset = CGSize(width: 1, height: 3)
        self.registration.font = UIFont(name: "Rockwell Bold", size: 40)
        self.registration.textAlignment = .center
        self.view.addSubview(registration)
    }
    
    //MARK: - Создание кнопки входа
    fileprivate func createLoginButton() {
        self.loginButton = UIButton(type: .system)
        
        self.loginButton.frame = CGRect(x: 219, y: 535, width: 158, height: 35)
        self.loginButton.setTitle("Вход", for: .normal)
        self.loginButton.setTitleColor(UIColor.white, for: .normal)
        self.loginButton.backgroundColor = UIColor.orange
        self.loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.loginButton.layer.cornerRadius = 8
        self.loginButton.addTarget(self, action: #selector(authButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(loginButton)
    }
    
    //MARK: - Создание кнопки регистрации
    fileprivate func createRegistrationButton() {
        self.registrationButton = UIButton(type: .system)
        self.registrationButton.frame = CGRect(x: 16, y: 535, width: 158, height: 35)
        self.registrationButton.setTitle("Регистрация", for: .normal)
        self.registrationButton.setTitleColor(UIColor.white, for: .normal)
        self.registrationButton.backgroundColor = UIColor.orange
        self.registrationButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.registrationButton.layer.cornerRadius = 8
        self.registrationButton.alpha = 0.9
        self.view.addSubview(registrationButton)
    }
    
    //MARK: - Создание текстового поля для Email
    fileprivate func createEmailTF() {
        
    }
    
}
