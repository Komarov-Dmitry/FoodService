//
//  AuthVC.swift
//  TabBarController.серивиседы
//
//  Created by Комаров Дмитрий  on 17.11.2023.
//

import UIKit

class AuthVC: UIViewController {
    
    private var registration       = UILabel()
    private var warrningAuthLabel  = UILabel()
    private var loginButton        = UIButton()
    private var registrationButton = UIButton()
    private var emailTF            = UITextField()
    private var passwordTF         = UITextField()
    private var scrollView         = UIScrollView()
    private var tabBarVC: UITabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        view.addSubview(scrollView)
        
        createRegistrationLabel()
        createLoginButton()
        createRegistrationButton()
        createEmailTF()
        createPasswordTF()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    deinit {
        // Отписываемся от уведомлений при деинициализации
        NotificationCenter.default.removeObserver(self)
    }
    
    
    //MARK: - Таргет на кнопку Авторизоваться
    @objc private func authButtonTapped() {
        
//        guard let email = emailTF.text, !email.isEmpty,
//              let password = passwordTF.text, !password.isEmpty else {
//            createWarrningAuthLabel("Введите почту или пароль")
//            return
//        }
        
        // Проверка формата электронной почты
//        if !isValidEmail(email) {
//            createWarrningAuthLabel("Введите корректный адрес  почты")
//            return
//        }
        
        if let window = UIApplication.shared.windows.first, let sceneDelegate = window.windowScene?.delegate as? SceneDelegate {
            let tabBarVC = createTabBarController()
            sceneDelegate.window?.rootViewController = tabBarVC
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    //MARK: - Создание createTabBarController()
    private func createTabBarController() -> UITabBarController {
        // Создание MenuVC и его NavigationController
        let menuVC = MenuVC()
        let menuNavigationController = UINavigationController(rootViewController: menuVC)
        menuVC.navigationItem.title = "Меню"
        menuVC.tabBarItem = UITabBarItem(title: "Меню", image: UIImage(systemName: "fork.knife"), tag: 0)

        // Создание ProfileVC
        let profileVC = ProfileVC()
        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        profileVC.navigationItem.title = "Ваш профиль"
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 1)

        // Создание BasketVC и его NavigationController
        let basketVC = BasketVC()
        let basketNavigationController = UINavigationController(rootViewController: basketVC)
        basketVC.navigationItem.title = "Корзина"
        basketVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "basket"), tag: 2)

        // Создание UITabBarController и установка в него созданных контроллеров
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([menuNavigationController, profileNavigationController, basketNavigationController], animated: true)
        menuVC.didFoodAdded = { food in basketVC.addProductToBasket(food)}

        tabBarVC.tabBar.tintColor = UIColor.orange
        tabBarVC.tabBar.shadowImage = UIImage()
        tabBarVC.tabBar.backgroundImage = UIImage()

        // Добавление линии под таб-баром
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: tabBarVC.tabBar.frame.width, height: 1))
        lineView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        tabBarVC.tabBar.addSubview(lineView)

        self.tabBarVC = tabBarVC
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
        self.scrollView.addSubview(registration)
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
        
        self.scrollView.addSubview(loginButton)
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
        self.scrollView.addSubview(registrationButton)
    }
    
    //MARK: - Создание текстового поля для Email
    fileprivate func createEmailTF() {
        self.emailTF.frame = CGRect(x: 16, y: 383, width: 361, height: 34)
        self.emailTF.placeholder = "Email"
        self.emailTF.keyboardType = .emailAddress
        self.emailTF.returnKeyType = .next
        self.emailTF.borderStyle = UITextField.BorderStyle.roundedRect
        self.emailTF.delegate = self
        
        self.scrollView.addSubview(emailTF)
    }
    
    //MARK: - Создание текстового поля для Пароля
    fileprivate func createPasswordTF() {
        self.passwordTF.frame = CGRect(x: 16, y: 425, width: 361, height: 34)
        self.passwordTF.placeholder = "Password"
        self.passwordTF.borderStyle = UITextField.BorderStyle.roundedRect
        self.passwordTF.delegate = self
        self.passwordTF.isSecureTextEntry = true
        self.scrollView.addSubview(passwordTF)
    }
    //MARK: - Лейбл Ошибки
    fileprivate func createWarrningAuthLabel(_ warrnigText: String) {
        self.warrningAuthLabel.text = warrnigText
        self.warrningAuthLabel.frame = CGRect(x: 16, y: 467, width: 361, height: 21)
        self.warrningAuthLabel.textColor = UIColor.red
        
        self.warrningAuthLabel.font = UIFont(name: "System", size: 19)
        self.warrningAuthLabel.textAlignment = .center
        self.warrningAuthLabel.sizeToFit()
        
        self.scrollView.addSubview(warrningAuthLabel)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in
            
            self?.warrningAuthLabel.isHidden = true
            self?.warrningAuthLabel.isHidden = false
            
        }
    }
    
    //MARK: - Обработка открытия клавиатуры
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo,
           let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            // Рассчитываем размер области, которую нужно проскроллить
            let halfKeyboardHeight = keyboardFrame.size.height / 2.0
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: halfKeyboardHeight, right: 0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
            
            // Если активным является текстовое поле, прокручиваем так, чтобы оно было видимо
            if let activeField = UIResponder.currentFirstResponder as? UITextField {
                var aRect = self.view.frame
                aRect.size.height -= halfKeyboardHeight
                let frame = activeField.convert(activeField.bounds, to: scrollView)
                if !aRect.contains(frame.origin) {
                    scrollView.scrollRectToVisible(frame, animated: true)
                }
            }
        }
    }
    
    
    
    //MARK: - Обработка закрытия клавиатуры
    @objc private func keyboardWillHide(notification: NSNotification) {
        // Возвращаем scrollView к исходному состоянию
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
}

extension AuthVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            authButtonTapped()
        }
        return true
    }
    
}

extension UIResponder {
    private weak static var _currentFirstResponder: UIResponder? = nil
    
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(findFirstResponder(sender:)), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }
    
    @objc private func findFirstResponder(sender: Any) {
        UIResponder._currentFirstResponder = self
    }
}
