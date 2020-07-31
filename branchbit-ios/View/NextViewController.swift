//
//  NextViewController.swift
//  branchbit-ios
//
//  Created by Hugo on 30/07/20.
//  Copyright © 2020 Elektra. All rights reserved.
//

import UIKit

class NextViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var data: [String]!
    var titleDate = "Selecciona una fecha"
    var options: [String] = OptionsModel.getOptions()

    var date = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch data[section]{
        case "Sexo (Masculio/Femenino)":
            return options.count
        default:
            return 1;
        }
        
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section]
    }
    
    let cameraCell: CameraCell = UIView.fromNib()
    let datecell: DatePicker = UIView.fromNib()

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch data[indexPath.section] {
        case "Cámara":
            debugPrint("camera")
            cameraCell.photoButton.addTarget(self, action: #selector(setCamera), for: .touchUpInside)
            cameraCell.selectionStyle = .none
            return cameraCell
        case "Foto":
            let cell: CameraCell = UIView.fromNib()
            cell.isCamera = false
            cell.SetPhoto()
            cell.selectionStyle = .none
            cell.Photo.downloaded(from: "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papercraft-D_NQ_NP_892880-MLA26232224460_102017-F.jpg")
            return cell
        case "Nombre Completo":
            return setInput(maxLength: 35, InputType: .alphaNumeric)
        case "Número Telefónico":
            return setInput(maxLength: 10, InputType: .onlyNumbers, keyboardType: .numberPad)
        case "Fecha de Nacimiento":
            return setDateCell()
        case "Sexo (Masculio/Femenino)":
            let cell =  UITableViewCell()
            cell.textLabel?.text = options[indexPath.row]
            return cell
        case "Color Favorito":
            let cell: Select = UIView.fromNib()
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }

    @objc func BarButtonTapped(_ sender: UIBarButtonItem){
        datecell.textField.text = date
        self.view.endEditing(true)
    }
    @objc func dateChanged(_ sender: UIDatePicker){
        let datef = DateFormatter()
        datef.dateStyle = .medium
        date = datef.string(from: sender.date)
        debugPrint(date)
    }
    
    func setDateCell() -> UITableViewCell{
        datecell.textField.placeholder = "Selecciona una fecha"
        let picker = UIDatePicker()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(BarButtonTapped))
        doneButton.title = "Seleccionar Hora"
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: true)
        toolbar.isTranslucent = false
        datecell.textField.inputAccessoryView = toolbar
        datecell.textField.inputView = picker
        datecell.selectionStyle = .none
        datecell.textField.text = date
        picker.addTarget(self, action: #selector(self.dateChanged(_:)), for: .valueChanged)
        return datecell

    }
    
    func setInput(maxLength: Int, InputType: ValueType, keyboardType: UIKeyboardType = .default) -> UITableViewCell{
        let cell: DatePicker = UIView.fromNib()
        cell.textField.maxLength = maxLength
        cell.selectionStyle = .none

        cell.textField.valueType = InputType
        cell.textField.delegate = self
        cell.textField.keyboardType = keyboardType
        return cell
    }

}
extension NextViewController{
    @objc func setCamera(){
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        cameraCell.Photo.image = image
        cameraCell.SetPhoto()
    }
    

}


extension NextViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let sdcTextField = textField as? CustomTextField {
            return sdcTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else{
            return false
        }
    }
}
