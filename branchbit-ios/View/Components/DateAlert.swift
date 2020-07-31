//
//  DateAlert.swift
//  branchbit-ios
//
//  Created by Hugo on 30/07/20.
//  Copyright © 2020 Elektra. All rights reserved.
//

import UIKit
enum type {
    case date
    case time
}
class DateAlert: UIView {
    
    private var dateformat = DateFormatter()
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet var view: UIView!
    
     var datepicker: UIDatePicker!
    
    var doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(BarButtonTapped))
    

    
    func initialize(format: type, maximumhour: Date){
        UINib(nibName: "DateAlert", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)

        //configuracion del boton de listo
        doneButton.title = "Seleccionar Hora"
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: true)
        toolbar.isTranslucent = false
        
        
        datepicker = UIDatePicker()
        type(format: format, maximumhour: maximumhour)
        textfield.inputAccessoryView = toolbar
        datepicker.addTarget(self, action: #selector(self.dateChanged(datepicker:)), for: .valueChanged)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped(gestureRecognizers:)))
        
        addGestureRecognizer(tapGesture)
        
    }
    
    @objc func BarButtonTapped()
    {
        endEditing(true)
    }
    
    @objc func viewTapped(gestureRecognizers: UITapGestureRecognizer) {
        endEditing(true)
    }
    
    @objc func dateChanged(datepicker: UIDatePicker){
        var dateFormatter = DateFormatter()
        dateFormatter = dateformat
        dateFormatter.locale = Locale(identifier: "en_US")
        print("la hora seleccionada es \(datepicker.date)")
        textfield.text = dateFormatter.string(from: datepicker.date)
    }
    //inicializador por conveniencia
    
    func type (format: type, maximumhour: Date){
        switch format {
        case .date:
            //Formato de vista cuando aparece para la fecha
            let loc = Locale(identifier: "es_MX")
            datepicker.locale = loc
            datepicker.datePickerMode = .date
            dateformat.dateFormat = "dd-MM-yyyy"
            textfield.inputView = datepicker
            textfield.text = dateformat.string(from: maximumhour)
            textfield.placeholder = "Fecha"

            

            break
        case .time:
            let loc = Locale(identifier: "es_CO")
            datepicker.locale = loc
            datepicker.datePickerMode = .time
            dateformat.dateFormat = "HH:mm a"
            dateformat.amSymbol = "AM"
            dateformat.pmSymbol = "PM"
            textfield.placeholder = "Hora"
            textfield.inputView = datepicker
            textfield.text = dateformat.string(from: maximumhour)

            }
    }
    
}
