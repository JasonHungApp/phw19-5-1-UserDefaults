//
//  ViewController.swift
//  Demo
//
//  Created by Peter Pan on 2022/10/3.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var randomNumberImageViews: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        printUserDefaults()

                        
        if let numbers = UserDefaults.standard.array(forKey: "j_array_randomNumber") as? [Int] {
            for i in 0..<randomNumberImageViews.count {
                let number = numbers[i]
                randomNumberImageViews[i].image = UIImage(systemName: "\(number).circle")
            }
        }
        
        testUserDefaults()
        
    }
    
    @IBAction func play(_ sender: Any) {
        var numbers = [Int]()
        for diceImageView in randomNumberImageViews {
            let number = Int.random(in: 0...50)
            diceImageView.image = UIImage(systemName: "\(number).circle")
            numbers.append(number)
        }
        UserDefaults.standard.set(numbers, forKey: "j_array_randomNumber")
    }
    
    @IBAction func clearUserDefaults(_ sender: Any) {
        // 使用
        UserDefaults.standard.removeKeysWithPrefix("j_")
        printUserDefaults()
    }
    
    
    func printUserDefaults(){
        //All values:
        print("\nAll values:")
        print(UserDefaults.standard.dictionaryRepresentation().values)
        //All keys:
        print("\nAll keys:")
        print(UserDefaults.standard.dictionaryRepresentation().keys)
        //All keys and values:
        print("\nAll keys and values:")
        print(UserDefaults.standard.dictionaryRepresentation())
    }
    
    func testUserDefaults(){
        //整數 (Integer):
        
        UserDefaults.standard.set(42, forKey: "j_intValue")
        let intValue = UserDefaults.standard.integer(forKey: "j_intValue")
        //浮點數 (Float):
        
        UserDefaults.standard.set(3.14, forKey: "j_floatValue")
        let floatValue = UserDefaults.standard.float(forKey: "j_floatValue")
        
        //雙精度浮點數 (Double):
        UserDefaults.standard.set(6.28, forKey: "j_doubleValue")
        let doubleValue = UserDefaults.standard.double(forKey: "j_doubleValue")
        
        //布爾值 (Boolean):
        UserDefaults.standard.set(true, forKey: "j_boolValue")
        let boolValue = UserDefaults.standard.bool(forKey: "j_boolValue")
        
        //字符串 (String):
        UserDefaults.standard.set("Hello, UserDefaults!", forKey: "j_stringValue")
        let stringValue = UserDefaults.standard.string(forKey: "j_stringValue")
        
        //數組 (Array):
        UserDefaults.standard.set(["Apple", "Banana", "Orange"], forKey: "j_fruitsArray")
        let fruitsArray = UserDefaults.standard.array(forKey: "j_fruitsArray") as? [String] ?? []
        
        //字典 (Dictionary):
        let userInfo = ["name": "John", "age": 25, "city": "Example City"] as [String : Any]
        UserDefaults.standard.set(userInfo, forKey: "j_userInfoDictionary")
        let userDictionary = UserDefaults.standard.dictionary(forKey: "j_userInfoDictionary") as? [String: Any] ?? [:]
        
        //日期 (Date):
        let currentDate = Date()
        UserDefaults.standard.set(currentDate, forKey: "j_currentDate")
        let storedDate = UserDefaults.standard.object(forKey: "j_currentDate") as? Date ?? Date()
        
        //URL:
        if let url = URL(string: "https://www.google.com.tw/") {
            UserDefaults.standard.set(url, forKey: "j_websiteURL")
        }
        let storedURL = UserDefaults.standard.url(forKey: "j_websiteURL")
    }
    
}


extension UserDefaults {
    func removeKeysWithPrefix(_ prefix: String) {
        let keysToRemove = dictionaryRepresentation().keys.filter { $0.hasPrefix(prefix) }
        print("keysToRemove = \(keysToRemove)")
        for key in keysToRemove {
            removeObject(forKey: key)
        }
        synchronize()
    }
}


