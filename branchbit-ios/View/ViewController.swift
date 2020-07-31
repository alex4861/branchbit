//
//  ViewController.swift
//  branchbit-ios
//
//  Created by Hugo on 30/07/20.
//  Copyright © 2020 Elektra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    var data = OptionsModel.getData()
    var selectedData:[String] = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfHaveOne()
        navigationController?.navigationBar.topItem?.title = "Selecciona una opción"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        nextButton.addTarget(self, action: #selector(nextAction(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func nextAction(_ sender: Any){
        selectedData.isEmpty ? setAlert(): self.performSegue(withIdentifier: "Next", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedData.append(data[indexPath.row])
        debugPrint(selectedData)
        checkIfHaveOne()

    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let index = selectedData.firstIndex(of: data[indexPath.row]) {
            selectedData.remove(at: index)
        }
        debugPrint(selectedData)
        checkIfHaveOne()

    }
    ///Check if the selected options isn't empty, and enable/Disable the button in each case
    func checkIfHaveOne(){
        nextButton.isEnabled = !selectedData.isEmpty
    }
    ///Alert only for Requirment, because func checkIfHaveOne enable and disbale the button, this alert never is trigger
    func setAlert(){
        let alert = UIAlertController(title: "Error", message: "Debe tener por lo menos un elemento seleccionado", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Aceptar", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NextViewController{
            destination.data = selectedData
        }
    }
    

    

}

