//
//  BipBopViewController.swift
//  BipBop Game
//
//  Created by Andrew Zaiets on 03.03.18.
//

import UIKit

class BipBopViewController: UIViewController {

    //MARK: - Properties
    
    let bipBopCellId = "BipBopCell"
    
    var dataSource = [String]()
    
    @IBOutlet weak var bipTextField: UITextField!
    @IBOutlet weak var bopTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Actions
    @IBAction func textFieldDidChanged(_ sender: UITextField) {
        if !bipTextField.text!.isEmpty && !bopTextField.text!.isEmpty {
            dataSource = bipBop(count: 1000)
            tableView.reloadData()
        }
    }
    
    //MARK: - Privates
    
    //MARK: - Navigation
    
    //MARK: - UI
    
    private func setupUI() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func bipBop(count: Int) -> [String] {
        
        var resultArray = [String]()
        
        guard let bip = Int(bipTextField.text!), let bop = Int(bopTextField.text!) else {
            return resultArray
        }
        
        for i in 0...count {
            let result = (i % bip, i % bop)
            switch result {
            case (0, 0):
                resultArray.append("BipBop")
            case (0, _):
                resultArray.append("Bip")
            case (_, 0):
                resultArray.append("Bop")
            default:
                resultArray.append(String(i))
            }
        }
        
        return resultArray
    }

}

extension BipBopViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: bipBopCellId)
        cell?.textLabel?.text = dataSource[indexPath.row]
        return cell!
    }
    
    
}

extension BipBopViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 1
    }
}
