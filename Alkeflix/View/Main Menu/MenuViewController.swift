//
//  MenuViewController.swift
//  Alkeflix
//
//  Created by Lucas Di Lorenzo on 15/09/2021.
//

import UIKit

class MenuViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    //MARK: - Atributes
    private let viewModel = MoviesViewModel()
    var genres:[Int:String] = [:]
    var valueSelected = ""
    var idSelected = 0
    @IBOutlet weak var picker: UIPickerView!
 
    
    @IBAction func genMovies(_ sender: Any) {
        let vc =  ListGenViewController(nibName: "ListGenViewController", bundle: nil)
        vc.gen = valueSelected
        vc.idGen = idSelected
        self.present(vc, animated: true,completion: nil)
    }
    
    @IBAction func topMovies(_ sender: Any) {
        let vc =  ListViewController(nibName: "ListViewController", bundle: nil)
        self.present(vc, animated: true,completion: nil)
    }
    
    
    
    @IBOutlet weak var roundedBtn: UIButton!
    @IBOutlet weak var roundedBtn2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedBtn.layer.cornerRadius = 15
        roundedBtn.layer.masksToBounds = true
        roundedBtn2.layer.cornerRadius = 15
        roundedBtn2.layer.masksToBounds = true
        picker.dataSource = self
        picker.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var g:[String] = []
        g = viewModel.getGenresForPicker(gen:genres)
        return g[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let g:[String] = viewModel.getGenresForPicker(gen:genres)
        let id:[Int] = viewModel.getIdGenresForPicker(gen:genres)
        valueSelected = g[row] as String
        idSelected = id[row] as Int
     }


}
