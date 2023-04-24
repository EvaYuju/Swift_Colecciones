//
//  ViewController.swift
//  S_17_Colecciones
//
//  Created by Eva Lopez Marquez on 20/4/23.
//

import UIKit

class ViewController: UIViewController {

    // Outlets
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    // Variables
    let myColorYellow = "PastelYellow"
    let myColorGreen = "PastelGreen"
    let myColorPink = "PastelPink"
    let nombreCelda = "MyCustomCollectionViewCell"
    let myReuseIdentifier = "myCustomCell" // Identificador Reuso celda custom

    
    private let myCountries = ["España","Japón","Portugal","México","Colombia","Francia","Alemania","Cuba",]

    // Tamaño mitad pantalla
    private let myCellWidth = UIScreen.main.bounds.width / 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.backgroundColor = UIColor(named: myColorPink )
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        // Añadir la celda customizada a la colección
        myCollectionView.register(UINib(nibName: nombreCelda, bundle: nil), forCellWithReuseIdentifier: myReuseIdentifier)
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    // Nº secciones
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // Nº items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return myCountries.count
    }
    
    // Referencia a la celda - Definir contenidos celdas
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Constante celda + identificar && no celdas por defecto => crear customizada
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myReuseIdentifier, for: indexPath) as? MyCustomCollectionViewCell
        
        // * Desempaquetamos porque estamos seguros de que hay contenido.
        cell!.myLabel.text = myCountries[indexPath.row]
        // Cambiar color del background según sí el nº de la celda es par o impar
        cell?.backgroundColor = indexPath.row % 2 == 0 ? UIColor(named: myColorYellow) : UIColor(named: myColorGreen)
        
        return cell!
    }
    
     
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // seccion , celda y valor celda
        print("\(indexPath.section) -> \(indexPath.row) \(myCountries[indexPath.row])")
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    // Definir tamaño  eldas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            // Objeto con valor alto y ancho
            return CGSize(width: myCellWidth, height: myCellWidth)
        }
        //return CGSize(width: myCellWidth * 2, height: myCellWidth * 2)
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
    }
}
