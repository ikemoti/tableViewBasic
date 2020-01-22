//
//  ViewController.swift
//  tableViewBasic
//
//  Created by USER on 2020/01/20.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource,UITextFieldDelegate{
    

    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    var textArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        textField.delegate = self
        
        }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //②セクションの中のセルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    //③セルを構築する箇所を呼ぶ
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = textArray[indexPath.row]
        //画像反映
        cell.imageView!.image = UIImage(named: "checkImage")
        return cell
    }
    
    //セルがタプされた時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextVC = storyboard?.instantiateViewController(identifier: "next")as!nextViewController
        
        nextVC.todoString = textArray[indexPath.row]
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    //高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/6
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            textArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        
        }
    }
    
    //キーボード閉じた時
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textArray.append(textField.text!)
        //キーボード閉じる
        textField.resignFirstResponder()
        
        textField.text = ""
        tableview.reloadData()
        
        return true
    }
}

