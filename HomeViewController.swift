//
//  HomeViewController.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 11.11.2022.
//

import UIKit
import Hero
import Lottie

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 
    var lottieAnimation = LottieAnimationView()
    var myColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
    var collectionView : UICollectionView?
    let btnCreate = UIButton()
    
    let lblExplore = UILabel()
    let lblLorem = UILabel()
    let lblEnter = UILabel()
    let lblSelect = UILabel()
    
    let imgSettings = UIImageView()
    let imgFolder = UIImageView()
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize(view: view)
        view.backgroundColor = .white
        
        CreategestureRecognizer()
        
        createCollectionView()
        createBtnCreate()
        createAllLabel()
        createSettingsImageView()
        createFolderImageView()
        createTextField()
        keyboardClose()
        
        btnCreate.backgroundColor = .gray
        btnCreate.isEnabled = false
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadCV), name: NSNotification.Name("reload"), object: nil)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        CoreDataHandler().fetchCreationsFromCoreData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        
        
        var category = categoryArr[indexPath.row]
        cell.categoryName.text = category.categoryName
        cell.categoryImg.image = category.categoryImg
        
        cell.btnUse1.tag = indexPath.row
        
        if categoryArr[indexPath.row].categoryName == selectedCategory.categoryName {
            btnCreate.backgroundColor = .black
            btnCreate.isEnabled = true
            cell.btnUse1.backgroundColor = .black
            cell.btnUse1.setTitleColor(.white, for: .normal)
            cell.btnUse1.setTitle("Using", for: .normal)
        } else {
            cell.btnUse1.backgroundColor = UIColor(red: 0.89, green: 0.65, blue: 0.24, alpha: 1.00)
            cell.btnUse1.setTitleColor(.black, for: .normal)
            cell.btnUse1.setTitle("Use", for: .normal)
            
        }
        
        return cell
    }

func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    selectedCategory = categoryArr[indexPath.row]
}
    
    
    func CreategestureRecognizer() {
        imgSettings.isUserInteractionEnabled = true
        imgFolder.isUserInteractionEnabled = true
        
        let settingsGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapSettings))
        imgSettings.addGestureRecognizer(settingsGestureRecognizer)
        
        let folderGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapFolder))
        imgFolder.addGestureRecognizer(folderGestureRecognizer)
    }
    
    func keyboardClose() {
      var keyboardGesturreRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(keyboardGesturreRecognizer)
    }
    
    func createCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: screenWidth * 1, height: screenHeight  * 0.09)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 15, right: 15)
        collectionView?.isUserInteractionEnabled = true
        
        guard let collectionView = collectionView else {
            return
        }
            collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
            collectionView.delegate = self
            collectionView.dataSource = self
            view.addSubview(collectionView)
        collectionView.frame = CGRect(x: 0 * screenWidth, y: 0.35 * screenHeight, width: screenWidth, height: 0.54 * screenHeight)
        
    }
        
    func createBtnCreate() {
        btnCreate.backgroundColor = .black
        btnCreate.setTitle("Create", for: .normal)
        btnCreate.setTitleColor(.white, for: .normal)
        btnCreate.layer.cornerRadius = 10
        btnCreate.addTarget(self, action: #selector(didTapBtnCreate), for: .touchUpInside)
        btnCreate.frame = CGRect(x: 0.1 * screenWidth, y: 0.892 * screenHeight, width: 0.8 * screenWidth, height:  0.06 * screenHeight)
        view.addSubview(btnCreate)
    }
        
    func creatingAnimation() {
        lottieAnimation = .init(name: "animation")
        lottieAnimation.frame = CGRect(x: 50, y: 300, width: 200, height: 200)
        lottieAnimation.center = view.center
        lottieAnimation.loopMode = .loop
        view.addSubview(lottieAnimation)
        lottieAnimation.play { finished in
        }
    }
    func createAllLabel() {
        
        lblExplore.text = "Explore"
        lblExplore.font = UIFont(name: "Inter-Reguler", size: 25)
        lblExplore.font = lblExplore.font.withSize(25)
        lblExplore.addCharacterSpacing()
        lblExplore.frame = CGRect(x: 0.07 * screenWidth, y: 0.05 * screenHeight, width: 0.3 * screenWidth, height:  0.06 * screenHeight)
        view.addSubview(lblExplore)
        
        
        lblLorem.text = "Lorem İpsum"
        lblLorem.font = UIFont.boldSystemFont(ofSize: 25)
        lblLorem.addCharacterSpacing(kernValue: 4)
        lblLorem.frame = CGRect(x: 0.07 * screenWidth, y: 0.1 * screenHeight, width: 0.5 * screenWidth, height:  0.06 * screenHeight)
        view.addSubview(lblLorem)
        
        lblEnter.text = "Enter Prompt"
        lblEnter.font = UIFont(name: "Inter-Reguler", size: 18)
        lblEnter.frame = CGRect(x: 0.1 * screenWidth, y: 0.15 * screenHeight, width: 0.3 * screenWidth, height:  0.06 * screenHeight)
        view.addSubview(lblEnter)
        
        lblSelect.text = "Select an Category"
        lblSelect.font = UIFont.boldSystemFont(ofSize: 18)
        lblSelect.frame = CGRect(x: 0.05 * screenWidth, y: 0.285 * screenHeight, width: 0.5 * screenWidth, height:  0.06 * screenHeight)
        view.addSubview(lblSelect)
        
    }
    
    func createSettingsImageView() {
        imgSettings.image = UIImage(named: "Icon_Home_Settings")
        imgSettings.frame = CGRect(x: 0.85 * screenWidth, y: 0.06 * screenHeight, width: 0.13 * screenWidth, height:  0.06 * screenHeight)
        view.addSubview(imgSettings)
    }
    
    func createFolderImageView() {
        imgFolder.image = UIImage(named: "Icon_Home_History")
        imgFolder.frame = CGRect(x: 0.7 * screenWidth, y: 0.06 * screenHeight, width: 0.13 * screenWidth, height:  0.06 * screenHeight)
        view.addSubview(imgFolder)
    }
    
    func createTextField() {
        let attrstr = NSAttributedString(string: "      Type Something...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        textField.frame = CGRect(x: 0.05 * screenWidth, y: 0.218 * screenHeight, width: 0.9 * screenWidth, height:  0.05 * screenHeight)
        textField.layer.borderColor = myColor.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 15
        textField.attributedPlaceholder = attrstr
        textField.addTarget(self, action: #selector(HomeViewController.textFieldDidChange(_:)), for: .editingChanged)
        view.addSubview(textField)
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    @objc func didTapSettings() {
        let vc2 = SettingsViewController()
        vc2.isHeroEnabled = true
        vc2.modalPresentationStyle = .fullScreen
        vc2.hero.modalAnimationType = .pageOut(direction: .left)
        present(vc2, animated: true)
    }
    
    @objc func didTapFolder() {
        let vc3 = HistoryViewController()
        vc3.isHeroEnabled = true
        vc3.modalPresentationStyle = .fullScreen
        vc3.hero.modalAnimationType = .pageOut(direction: .left)
        present(vc3, animated: true)
    }
    
    @objc func didTapBtnCreate() {
        if textField.text == "" {
            showAlert(title: "Error", message: "prompt cannot be empty", ViewController: self, Completion: {})
        }
        else{
        let bgView = UIView()
        bgView.frame = view.bounds
        bgView.backgroundColor = .white
        view.addSubview(bgView)
        creatingAnimation()
        
        
        let creating = Creation(prompt: textField.text!, style: selectedCategory)
        
        CreationHandler().fetchArtFromAPI(creation: creating) { [self] resultImage in
            creating.resultImage = resultImage
            
            //Coredata Save
            CoreDataHandler().saveCreationToCoreData(creation: creating)
            
            NotificationCenter.default.addObserver(self, selector: #selector(fetchData), name: NSNotification.Name("fetchData"), object: nil)

            
            DispatchQueue.main.async {
                self.lottieAnimation.removeFromSuperview()
                bgView.removeFromSuperview()
            }
            
            DispatchQueue.main.async {
                let vc2 = CreatedImageViewController()
                vc2.choosenCreation = creating
                vc2.isHeroEnabled = true
                vc2.modalPresentationStyle = .fullScreen
                vc2.hero.modalAnimationType = .pageOut(direction: .left)
                self.present(vc2, animated: false)
            }
            }
        }
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        print(textField)
    }

    
    @objc func reloadCV(){
        collectionView?.reloadData()
    }

    @objc func fetchData() {
        CoreDataHandler().fetchCreationsFromCoreData()
    }
    
    func showAlert(title : String , message : String, ViewController : UIViewController, Completion : @escaping () -> ()) {
        let showAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { UIAlertAction in
        }
        showAlert.addAction(okButton)
        self.present(showAlert, animated: true, completion: nil)
    }
    
}

extension UILabel {
  func addCharacterSpacing(kernValue: Double = 5.15) {
    guard let text = text, !text.isEmpty else { return }
    let string = NSMutableAttributedString(string: text)
    string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
    attributedText = string
  }
}
