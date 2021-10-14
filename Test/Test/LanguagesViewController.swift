//
//  LanguagesViewController.swift
//  Test
//
//  Created by Stroman on 2021/9/19.
//

import UIKit

class LanguagesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    deinit {
        print(type(of: self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let array:NSArray = NSArray.init(contentsOf: Bundle.main.url(forResource: "languages", withExtension: "plist")!)!
        self.languages = array as! [String]
        self.contentTableView.frame = self.view.bounds
        self.view.addSubview(self.contentTableView)
        // Do any additional setup after loading the view.
    }
    
    private var languages:[String] = []
    private lazy var contentTableView:UITableView = {
        let result:UITableView = UITableView.init(frame: .zero, style: .plain)
        result.tableHeaderView = UIView.init(frame: CGRect.init(origin: .zero, size: .zero))
        result.tableFooterView = UIView.init(frame: CGRect.zero)
        result.delegate = self
        result.dataSource = self
        result.register(UITableViewCell.self, forCellReuseIdentifier: "LanguageCell")
        return result
    }()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)
        cell.textLabel?.text = self.languages[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.languages.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        SFLocalizationManager.sharedInstance.updateLanguage(language: self.languages[indexPath.row])
        self.dismiss(animated: true) {
            NotificationCenter.default.post(name: NSNotification.Name.init(SFLanguageChangeNotification), object: nil)
        }
    }
}
