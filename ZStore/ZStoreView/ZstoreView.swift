//
//  ViewController.swift
//  ZStore
//
//  Created by APPLE on 27/11/23.
//

import UIKit

class ZstoreViewController: UIViewController {
    
    //MARK: Properties
    //Views
    var navigationBar = UIView()
    var navBar = UIView()
    var searchField = UITextField()
    var cancelSearchBarbtn = UIButton()
    var searchIcon = UIButton(type: .custom)
    var navigationTitleLbl = UILabel()
    var categoryCollectionView:UICollectionView!
    var offerBgView = UIView()
    var offerTitle = UILabel()
    var offerCollectionView:UICollectionView!
    var waterFallCollectionView:UICollectionView!
    var linearList = UITableView()
    var colorStackView = UIStackView()
    var sortBtn = UIButton(type: .custom)
    var sortTableView = UITableView()
    let transparentView = UIView()
    
    //Layout
    let categoryCellLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    let offerCellLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    let waterfallCellLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    var offerViewHeight = NSLayoutConstraint()
    
    //Data
    var selectedIndex = 1
    var selectedSortOption = Int()
    var categoryOptions = [Category]()
    var cardOffers = [CardOffer]()
    var linearProducts = [Product]()
    var originalLinearProducts = [Product]()
    var waterFallProducts = [Product]()
    var originalWaterFallProducts = [Product]()
    var favouriteProducts = [Product]()
    var searchResultCount = ""
    
    //MARK: View's Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupNavBar()
        self.setupSearchBar()
        self.setupCategoryCollectionView()
        self.setupOfferView()
        self.setupLinearList()
        self.setupWaterFallList()
        self.addSortOption()
        //GetData
        self.getDataFromServer()
    }
    //MARK: setupNavBar
    func setupNavBar() {
        //navigationBar
        navigationBar = UIView()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(navigationBar)
        navigationBar.backgroundColor = .clear
        
        //navigationTitleLbl
        navigationTitleLbl = UILabel()
        navigationTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        self.navigationBar.addSubview(navigationTitleLbl)
        navigationTitleLbl.textColor = UIColor.black
        navigationTitleLbl.text = "Zstore"
        navigationTitleLbl.font = UIFont(name: "SF Pro Text Bold", size: 30)
        navigationTitleLbl.font = UIFont.boldSystemFont(ofSize: 30)
        
        //searchIcon
        searchIcon = UIButton(type: .custom)
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        self.navigationBar.addSubview(searchIcon)
        searchIcon.backgroundColor = .clear
        searchIcon.setImage(UIImage(named: "searchIcon"), for: .normal)
        searchIcon.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        
        //Constraints
        NSLayoutConstraint.activate([navigationBar.heightAnchor.constraint(equalToConstant: 44),
                                     navigationBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     navigationBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
                                     navigationBar.topAnchor.constraint(equalTo: self.view.safeTopAnchor, constant: 0),
                                     searchIcon.widthAnchor.constraint(equalToConstant: 44),
                                     searchIcon.heightAnchor.constraint(equalToConstant: 44),
                                     searchIcon.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 0),
                                     searchIcon.trailingAnchor.constraint(equalTo: self.navigationBar.trailingAnchor, constant: -8),
                                     
                                     navigationTitleLbl.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 0),
                                     navigationTitleLbl.leadingAnchor.constraint(equalTo: self.navigationBar.leadingAnchor, constant: 8),
                                     navigationTitleLbl.heightAnchor.constraint(equalToConstant: 36),
                                     navigationTitleLbl.trailingAnchor.constraint(equalTo: self.navigationBar.centerXAnchor, constant: 0)
                                    ])
    }
    
    func setupSearchBar() {
        
       navBar = UIView()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(navBar)
        navBar.backgroundColor = .clear
        
        //searchField
        searchField = UITextField()
        searchField.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(searchField)
        searchField.backgroundColor = .clear
        searchField.layer.cornerRadius = 19
        searchField.layer.borderColor = UIColor.separatorColor().cgColor
        searchField.layer.borderWidth = 1
        searchField.setLeftPaddingPoints(40)
        searchField.clearButtonMode = .always
        searchField.autocorrectionType = .no
        searchField.addTarget(self, action: #selector(textIsChanging), for: .editingChanged)
        
        //searchIcon
        var search = UIButton(type: .custom)
        search.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(search)
        search.backgroundColor = .clear
        search.setImage(UIImage(named: "searchIcon"), for: .normal)
        
        cancelSearchBarbtn = UIButton()
        cancelSearchBarbtn.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(cancelSearchBarbtn)
        cancelSearchBarbtn.setTitle("Cancel", for: .normal)
        cancelSearchBarbtn.setTitleColor(UIColor.getCellBorderHighLiteColor(), for: .normal)
        cancelSearchBarbtn.backgroundColor = .clear
        cancelSearchBarbtn.addTarget(self, action: #selector(cancelSearchAction), for: .touchUpInside)
    
        navBar.isHidden = true
        //Constraints
        NSLayoutConstraint.activate([navBar.heightAnchor.constraint(equalToConstant: 44),
                                     navBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     navBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
                                     navBar.topAnchor.constraint(equalTo: self.view.safeTopAnchor, constant: 0),
                                    
                                     searchField.heightAnchor.constraint(equalToConstant: 36),
                                     searchField.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 10),
                                     searchField.widthAnchor.constraint(equalToConstant: 300),
                                     searchField.centerYAnchor.constraint(equalTo: navBar.centerYAnchor, constant: 0),
                                    
                                     search.widthAnchor.constraint(equalToConstant: 36),
                                     search.heightAnchor.constraint(equalToConstant: 36),
                                     search.centerYAnchor.constraint(equalTo: searchField.centerYAnchor, constant: 0),
                                     search.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 10),
                                    
                                     cancelSearchBarbtn.heightAnchor.constraint(equalToConstant: 44),
                                     cancelSearchBarbtn.leadingAnchor.constraint(equalTo: searchField.trailingAnchor, constant: 5),
                                     cancelSearchBarbtn.centerYAnchor.constraint(equalTo: searchField.centerYAnchor, constant: 0),
                                     cancelSearchBarbtn.widthAnchor.constraint(equalToConstant: 72)])
    }
    
    @objc func textIsChanging(_ textField: UITextField) {
        let keyword = textField.text!
        if keyword.isEmpty {
            self.getDataFromServer()
        } else {
            let resultedProducts = searchProducts(keyword: keyword)
            let data = categoryOptions[selectedIndex]
            if data.layout == "waterfall" {
                self.waterFallProducts.removeAll()
                self.waterFallProducts = resultedProducts
                self.waterFallCollectionView.reloadData()
                self.searchResultCount = "\(resultedProducts.count)"
            } else {
                self.linearProducts.removeAll()
                self.linearProducts = resultedProducts
                self.linearList.reloadData()
                self.searchResultCount = "\(resultedProducts.count)"
            }
            self.categoryCollectionView.reloadData()
        }
    }
    // Function to search for products based on a keyword
    func searchProducts(keyword: String) -> [Product] {
        let data = categoryOptions[selectedIndex]
        if data.layout == "waterfall" {
            let filteredProducts = waterFallProducts.filter { product in
                return product.name.lowercased().contains(keyword.lowercased()) ||
                product.description.lowercased().contains(keyword.lowercased())
            }
            return filteredProducts
        } else {
            let filteredProducts = linearProducts.filter { product in
                // Customize the search criteria as per your requirements
                return product.name.lowercased().contains(keyword.lowercased()) ||
                product.description.lowercased().contains(keyword.lowercased())
            }
            
            return filteredProducts
        }
    }

    
    //MARK: setupCategoryCollectionView
    func setupCategoryCollectionView() {
        //categoryCollectionView
        categoryCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: categoryCellLayout)
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: "CategoryCell")
        categoryCollectionView.showsVerticalScrollIndicator = false
        categoryCollectionView.showsHorizontalScrollIndicator = false
        categoryCollectionView.backgroundColor = .white
        self.view.addSubview(categoryCollectionView)
        self.categoryCellLayout.scrollDirection = .horizontal
        
        //CollectionView Constraints
        NSLayoutConstraint.activate([categoryCollectionView.heightAnchor.constraint(equalToConstant: 75),
                                     categoryCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     categoryCollectionView.topAnchor.constraint(equalTo: self.navigationBar.bottomAnchor, constant: 6),
                                     categoryCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)])
    }
    
    func setupOfferView () {
        //offerBgView
        offerBgView = UIView()
        offerBgView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(offerBgView)
        offerBgView.backgroundColor = .white
        
        //offerTitle
        offerTitle = UILabel()
        offerTitle.translatesAutoresizingMaskIntoConstraints = false
        self.offerBgView.addSubview(offerTitle)
        offerTitle.backgroundColor = .clear
        offerTitle.textColor = UIColor.getCellBorderHighLiteColor()
        offerTitle.font = UIFont.systemFont(ofSize: 18)
        offerTitle.text = "Offers"
        
        //icon
        var offerIcon = UIImageView()
        offerIcon.translatesAutoresizingMaskIntoConstraints = false
        self.offerBgView.addSubview(offerIcon)
        offerIcon.backgroundColor = .clear
        offerIcon.image = UIImage(named: "Offer")
        
        //OfferCollectionView
        offerCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: offerCellLayout)
        offerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        offerCollectionView.dataSource = self
        offerCollectionView.delegate = self
        offerCollectionView.register(OfferCollectionCell.self, forCellWithReuseIdentifier: "OfferCell")
        offerCollectionView.showsVerticalScrollIndicator = false
        offerCollectionView.showsHorizontalScrollIndicator = false
        offerCollectionView.backgroundColor = .clear
        self.offerBgView.addSubview(offerCollectionView)
        self.offerCellLayout.scrollDirection = .horizontal
        offerViewHeight = offerBgView.heightAnchor.constraint(equalToConstant: 164)
        offerViewHeight.isActive = true
        
        NSLayoutConstraint.activate([offerBgView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     offerBgView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
                                     offerBgView.topAnchor.constraint(equalTo: self.categoryCollectionView.bottomAnchor, constant: 2),
                                     offerIcon.heightAnchor.constraint(equalToConstant: 15),
                                     offerIcon.widthAnchor.constraint(equalToConstant: 10),
                                     offerIcon.leadingAnchor.constraint(equalTo: self.offerBgView.leadingAnchor, constant: 12),
                                     offerIcon.centerYAnchor.constraint(equalTo: offerTitle.centerYAnchor, constant: 0),
                                     
                                     offerTitle.leadingAnchor.constraint(equalTo: offerIcon.trailingAnchor, constant: 5),
                                     offerTitle.heightAnchor.constraint(equalToConstant: 25),
                                     offerTitle.topAnchor.constraint(equalTo: offerBgView.topAnchor, constant: 5),
                                     offerTitle.trailingAnchor.constraint(equalTo: self.offerBgView.trailingAnchor, constant: -10),
                                     
                                     offerCollectionView.leadingAnchor.constraint(equalTo: self.offerBgView.leadingAnchor, constant: 0),
                                     offerCollectionView.trailingAnchor.constraint(equalTo: self.offerBgView.trailingAnchor, constant: 0),
                                     offerCollectionView.topAnchor.constraint(equalTo: offerTitle.bottomAnchor, constant: 0),
                                     offerCollectionView.bottomAnchor.constraint(equalTo: self.offerBgView.bottomAnchor, constant: 0),
                                    ])
    }
    
    func setupLinearList() {
        //table view
        linearList = UITableView()
        linearList.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(linearList)
        linearList.dataSource = self
        linearList.delegate = self
        linearList.backgroundColor = .clear
        linearList.separatorStyle = .none
        linearList.showsHorizontalScrollIndicator = false
        linearList.showsVerticalScrollIndicator = false
        linearList.register(LinearListCell.self, forCellReuseIdentifier: "listCell")
        linearList.isHidden = true
        //constraints
        NSLayoutConstraint.activate([linearList.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     linearList.topAnchor.constraint(equalTo: self.offerBgView.bottomAnchor, constant: 0),
                                     linearList.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10),
                                     linearList.bottomAnchor.constraint(equalTo: self.view.safeBottomAnchor, constant: 0)])
    }
    
    func setupWaterFallList() {
        //waterFallCollectionView
        waterFallCollectionView = UICollectionView(frame: view.frame, collectionViewLayout:waterfallCellLayout )
        waterFallCollectionView.translatesAutoresizingMaskIntoConstraints = false
        waterFallCollectionView.dataSource = self
        waterFallCollectionView.delegate = self
        waterFallCollectionView.register(WaterFallLayoutCell.self, forCellWithReuseIdentifier: "waterfallCell")
        waterFallCollectionView.showsVerticalScrollIndicator = false
        waterFallCollectionView.showsHorizontalScrollIndicator = false
        waterFallCollectionView.backgroundColor = .clear
        self.view.addSubview(waterFallCollectionView)
        self.waterfallCellLayout.scrollDirection = .vertical
        waterFallCollectionView.isHidden = true
        //constraints
        NSLayoutConstraint.activate([waterFallCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     waterFallCollectionView.topAnchor.constraint(equalTo: self.offerBgView.bottomAnchor, constant: 0),
                                     waterFallCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10),
                                     waterFallCollectionView.bottomAnchor.constraint(equalTo: self.view.safeBottomAnchor, constant: 0)])
    }
    func addSortOption() {
        //TraansparentView
        transparentView.backgroundColor = UIColor.transparentBgColor()
        transparentView.frame = self.view.frame
        self.view.addSubview(transparentView)
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(hideSortingView))
        transparentView.addGestureRecognizer(tapgesture)
        
        //TableView
        sortTableView = UITableView()
        sortTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sortTableView)
        sortTableView.backgroundColor = .clear
        sortTableView.delegate = self
        sortTableView.dataSource = self
        sortTableView.layer.cornerRadius = 20
        sortTableView.layer.borderColor = UIColor.systemGray5.cgColor
        sortTableView.layer.borderWidth = 1.0
        sortTableView.showsHorizontalScrollIndicator = false
        sortTableView.showsVerticalScrollIndicator = false
        sortTableView.register(SortCell.self, forCellReuseIdentifier: "SortCell")
        sortTableView.rowHeight = 54
        sortTableView.isScrollEnabled = false
        let tableViewHeight = CGFloat(2) * sortTableView.rowHeight
      //  sortTableView.separatorStyle = .none
        if #available(iOS 15.0, *) {
            sortTableView.sectionHeaderTopPadding = 0
        }
        
        transparentView.isHidden = true
        sortTableView.isHidden = true
        //sort
        sortBtn = UIButton(type: .custom)
        sortBtn.translatesAutoresizingMaskIntoConstraints = false
        sortBtn.setImage(UIImage(named: "Sort"), for: .normal)
        sortBtn.backgroundColor = .clear
        self.view.addSubview(sortBtn)
        sortBtn.addTarget(self, action: #selector(sortAction), for: .touchUpInside)
        //constraints
        sortBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
        sortBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        sortBtn.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: 0).isActive = true
        sortBtn.bottomAnchor.constraint(equalTo: self.view.safeBottomAnchor, constant: 0).isActive = true
        NSLayoutConstraint.activate([sortTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70),
                                     sortTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                                     sortTableView.bottomAnchor.constraint(equalTo: self.sortBtn.topAnchor, constant: 5),
                                     sortTableView.heightAnchor.constraint(equalToConstant: tableViewHeight + 37)])
        
        self.view.bringSubviewToFront(sortBtn)
    }
    
    func toShowInitialList() {
        let data = categoryOptions[selectedIndex]
        self.getCategoryAppliedList(id: data.id,layout: data.layout)
    }
    //MARK: APICall
    func getDataFromServer() {
        let url = "https://raw.githubusercontent.com/princesolomon/zstore/main/data.json"
        APIDownload.sendGetMethod(url) { resultDic in
            self.categoryOptions.removeAll()
            self.cardOffers.removeAll()
            self.linearProducts.removeAll()
            self.waterFallProducts.removeAll()
            self.originalLinearProducts.removeAll()
            let categories = resultDic.object(forKey: "category") as! [[String:Any]]
            for categoryOption in categories { //Categories
                print("\(categoryOption)")
                if let id = categoryOption["id"] as? String, let layout = categoryOption["layout"] as? String, let name = categoryOption["name"] as? String {
                    let category = Category(id: id, name: name, layout: layout)
                    self.categoryOptions.append(category)
                }
            }
            self.categoryCollectionView.reloadData()
            let offers = resultDic.object(forKey: "card_offers") as! [[String:Any]]
            for offer in offers { //Card Offers
                print("\(offer)")
                if let id = offer["id"] as? String, let cardName = offer["card_name"] as? String, let imageUrl = offer["image_url"] as? String, let max_discount = offer["max_discount"] as? String, let offerDes = offer["offer_desc"] as? String, let percentage = offer["percentage"] as? Double {
                    let offer = CardOffer(id: id, percentage: percentage, cardName: cardName, offerDescription: offerDes, maxDiscount: max_discount, imageUrl: imageUrl)
                    self.cardOffers.append(offer)
                }
            }
            
            let products = resultDic.object(forKey: "products") as! [[String:Any]]
            for product in products {
                print("\(product)")
                if let id = product["id"] as? String, let name = product["name"] as? String, let rating = product["rating"] as? Double, let reviewCount = product["review_count"] as? Int, let price = product["price"] as? Int, let categoryId = product["category_id"] as? String, let imageUrl = product["image_url"] as? String, let desc = product["description"] as? String, let cardOfferIds = product["card_offer_ids"] as? [String]{
                    var layout = String()
                    var product:Product?
                    for category in self.categoryOptions {
                        let id = category.id
                        if id == categoryId {
                            layout = category.layout
                        }
                    }
                    if layout == "waterfall" { //collectionView
                        product = Product(id: id, name: name, rating: rating, reviewCount: reviewCount, price: price, categoryId: categoryId, cardOfferIds: cardOfferIds, imageUrl: imageUrl, description: desc, layout: layout)
                        self.waterFallProducts.append(product!)
                        self.originalWaterFallProducts.append(product!)
                    } else { //Tableview
                        product = Product(id: id, name: name, rating: rating, reviewCount: reviewCount, price: price, categoryId: categoryId, cardOfferIds: cardOfferIds, imageUrl: imageUrl, description: desc, layout: layout)
                        self.linearProducts.append(product!)
                        self.originalLinearProducts.append(product!)
                    }
                }
            }
            self.linearList.reloadData()
            self.offerCollectionView.reloadData()
            self.categoryCollectionView.reloadData()
            self.waterFallCollectionView.reloadData()
            self.toShowInitialList()
        }
        
    }
    
    func getOfferAppliedList() {
      let filteredProduct = offerFilterProducts()
        self.linearProducts.removeAll()
        self.linearProducts = filteredProduct
        self.linearList.reloadData()
    }
    //getCategoryAppliedList
    func getCategoryAppliedList(id:String, layout:String) {
        if layout == "waterfall" {
            self.waterFallCollectionView.isHidden = false
            self.linearList.isHidden = true
            let categoryFilteredProduct = getCategoryFilteredProducts(array: self.originalWaterFallProducts, categoryId: id)
            print("\(categoryFilteredProduct)")
            self.waterFallProducts.removeAll()
            self.waterFallProducts = categoryFilteredProduct
            self.waterFallCollectionView.reloadData()
        } else {
            self.waterFallCollectionView.isHidden = true
            self.linearList.isHidden = false
            let categoryFilteredProduct = getCategoryFilteredProducts(array: self.originalLinearProducts, categoryId: id)
            print("\(categoryFilteredProduct)")
            self.linearProducts.removeAll()
            self.linearProducts = categoryFilteredProduct
            self.linearList.reloadData()
        }
    }
    func offerFilterProducts() -> [Product] {
        return linearProducts.filter { product in
            cardOffers.contains { cardOffer in
                return product.cardOfferIds.contains(cardOffer.id)
            }
        }
    }
    //getCategoryAppliedList
    func getCategoryFilteredProducts(array:[Product], categoryId:String) -> [Product]{
        for product in array {
            print(product.categoryId)
        }
        print("CategoryIdSelected \(categoryId)")
        return array.filter{ $0.categoryId == categoryId}
    }
    //MARK: Actions
    @objc func sortAction() {
        print("Sorting")
        transparentView.isHidden = false
        self.sortTableView.isHidden = false
    }
    @objc private func hideSortingView() {
        transparentView.isHidden = true
        self.sortTableView.isHidden = true
    }
    
    @objc func cancelSearchAction() {
        self.navigationBar.isHidden = false
        self.navBar.isHidden = true
        self.offerViewHeight.constant = 164
        self.offerViewHeight.isActive = true
        self.searchResultCount = ""
        self.getDataFromServer()
    }
    @objc func searchAction() {
        self.navigationBar.isHidden = true
        self.navBar.isHidden = false
        self.offerViewHeight.constant = 0
        self.offerViewHeight.isActive = true
       
    }
}

//MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension ZstoreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return categoryOptions.count
        } else if collectionView == offerCollectionView {
            return self.cardOffers.count
        } else {
            return self.waterFallProducts.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            let cell: CategoryCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionCell
            if self.categoryOptions.count  > 0 {
                let data = categoryOptions[indexPath.item]
                cell.titleLbl.text = data.name
                if self.selectedIndex == indexPath.item {
                    cell.backgroundColor =  UIColor.getCellBgHighLiteColor()
                    cell.titleLbl.backgroundColor = UIColor.getCellBgHighLiteColor()
                    cell.layer.borderColor =  UIColor.getCellBorderHighLiteColor().cgColor
                    let searchCount = self.searchResultCount == "" ? "" : "(" + searchResultCount + ")"
                    cell.titleLbl.text = data.name + " " + searchCount
                } else {
                    cell.titleLbl.backgroundColor =  UIColor.white
                    cell.backgroundColor = UIColor.white
                    cell.layer.borderColor =  UIColor.separatorColor().cgColor
                    cell.titleLbl.text = data.name
                }
            }
            return cell
        } else if collectionView == offerCollectionView {
            let cell: OfferCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath) as! OfferCollectionCell
            let data = self.cardOffers[indexPath.item]
            cell.offerDescriptionTxt.text = data.offerDescription
            cell.offerTxt.text = data.maxDiscount
            let imageUrl = data.imageUrl
            if imageUrl != "" {
                cell.img.downloadedFrom(url: URL(string:imageUrl), contentMode: .scaleAspectFit, completion: {
                })
            } else {
                print("Unable to get image")
            }
            return cell
        } else {
            let cell: WaterFallLayoutCell = collectionView.dequeueReusableCell(withReuseIdentifier: "waterfallCell", for: indexPath) as! WaterFallLayoutCell
        
            if self.waterFallProducts.count > 0 {
                let data = self.waterFallProducts[indexPath.item]
                cell.listTitle.text = data.name
                cell.ratingLbl.text = "\(data.rating)"
                cell.ratingCountLbl.text = "(" + "\(data.reviewCount)" + ")"
                cell.priceLbl.text = "₹" + " " + "\(data.price)"
                cell.dayLbl.text = data.description
                cell.ratingView.rating = data.rating
                cell.favBtn.tag = indexPath.item
                cell.favTaggedBtn.tag = indexPath.item
                cell.favTaggedBtn.isHidden = true
                cell.favBtn.isHidden = false
                cell.favBtn.addTarget(self, action: #selector(addToFavAction), for: .touchUpInside)
                cell.favTaggedBtn.addTarget(self, action: #selector(unFavAction), for:.touchUpInside)
                if self.favouriteProducts.count > 0 {
                    for favdata in favouriteProducts {
                        if favdata.id == data.id {
                            cell.favTaggedBtn.isHidden = false
                            cell.favBtn.isHidden = true
                        }
                    }
                }
                let imageUrl = data.imageUrl
                if imageUrl != "" {
                    cell.listImg.downloadedFrom(url: URL(string:imageUrl), contentMode: .scaleAspectFit, completion: {
                    })
                } else {
                    print("Unable to get image")
                }
            }
            return cell
        }
    }
    @objc func addToFavAction(_sender:UIButton) {
        let favData = self.waterFallProducts[_sender.tag]
        self.favouriteProducts.append(favData)
        self.waterFallCollectionView.reloadData()
    }
    @objc func unFavAction(_sender:UIButton) {
        let removefavData = self.waterFallProducts[_sender.tag]
        if let index = self.favouriteProducts.firstIndex(where: { $0.id == removefavData.id }) {
            // Found the matching element, now remove it
            self.favouriteProducts.remove(at: index)
            self.waterFallCollectionView.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            self.categoryCellLayout.sectionInset = UIEdgeInsets(top: 4, left: 8, bottom: 0, right: 8)
            self.categoryCellLayout.scrollDirection = .horizontal
            self.categoryCellLayout.minimumInteritemSpacing = 5
            self.categoryCellLayout.minimumLineSpacing = 5
            return CGSize(width:calculateCellWidth(forItemAt: indexPath), height: 32)//120
        } else if collectionView == offerCollectionView {
            self.offerCellLayout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 0, right: 8)
            self.offerCellLayout.scrollDirection = .horizontal
            self.offerCellLayout.minimumInteritemSpacing = 5
            self.offerCellLayout.minimumLineSpacing = 15
            return CGSize(width:self.offerCollectionView.frame.width - 30, height: 120)
        } else {
            self.waterfallCellLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            self.waterfallCellLayout.scrollDirection = .vertical
            self.waterfallCellLayout.minimumInteritemSpacing = 3
            self.waterfallCellLayout.minimumLineSpacing = 5
            return CGSize(width:200, height: 400)//120
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.categoryCollectionView {
            self.selectedIndex = indexPath.item
            let data = categoryOptions[indexPath.item]
            self.getCategoryAppliedList(id: data.id,layout: data.layout)
            self.categoryCollectionView.reloadData()
        } else if collectionView == offerCollectionView {
            self.getOfferAppliedList()
        } else {
            self.waterFallCollectionView.reloadData()
        }
    }
}
//MARK: Supporting Functions
extension ZstoreViewController {
    private func calculateCellWidth(forItemAt indexPath: IndexPath) -> CGFloat {
        let labelText = categoryOptions[indexPath.item].name
        let labelSize = (labelText as NSString).size(withAttributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize:15)])
            let cellWidth = labelSize.width + 30
            return cellWidth
        }
}

extension ZstoreViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == linearList {
            return self.linearProducts.count
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == sortTableView {
            return 37
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == sortTableView {
            let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
            headerView.backgroundColor = UIColor.headerColor()
            //listTitle
            var title = UILabel()
            title.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(title)
            title.backgroundColor = .clear
            title.textColor = UIColor.liteColor()
            title.font = UIFont.systemFont(ofSize: 13)
            title.text = "Filter Order: From Top to Bottom"
            title.textAlignment = .center
            //con
            NSLayoutConstraint.activate([title.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
                                         title.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
                                         title.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0),
                                         title.heightAnchor.constraint(equalToConstant: 20)])
            return headerView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == linearList {
            let cell: LinearListCell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! LinearListCell
            if self.linearProducts.count > 0 {
                let data = linearProducts[indexPath.row]
                cell.listTitle.text = data.name
                cell.ratingLbl.text = "\(data.rating)"
                cell.ratingCountLbl.text = "(" + "\(data.reviewCount)" + ")"
                cell.priceLbl.text = "₹" + " " + "\(data.price)"
                cell.dayLbl.text = data.description
                cell.ratingView.rating = data.rating
                let imageUrl = data.imageUrl
                if imageUrl != "" {
                    cell.listImg.downloadedFrom(url: URL(string:imageUrl), contentMode: .scaleAspectFit, completion: {
                    })
                } else {
                    print("Unable to get image")
                }
                
            }
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        } else {
            let cell: SortCell = tableView.dequeueReusableCell(withIdentifier: "SortCell", for: indexPath) as! SortCell
            if indexPath.row == 0 {
                cell.titleLbl.text = "Rating"
                cell.titleImg.image = UIImage(named: "ratingStar")
            } else {
                cell.titleLbl.text = "Price"
                cell.titleImg.image = UIImage(named: "price")
            }
            cell.selectOption.image = selectedSortOption == indexPath.row ? UIImage(named: "selectedIcon") : UIImage(named: "unselectedIcon")
            cell.selectionStyle = .none
            cell.backgroundColor = .white
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == linearList {
            return 200
        } else {
            return 54
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == sortTableView {
            if indexPath.row == 0 {//Rating default
                self.getDataAsPerRating()
            } else { //price
                self.sortDataAsPerPrice()
            }
            selectedSortOption = indexPath.row
            self.sortTableView.reloadData()
            self.hideSortingView()
        }
    }
    //configureColors
    func configureColors(with colors: [UIColor]) {
        // Remove any existing color circles
        for subview in colorStackView.subviews {
            subview.removeFromSuperview()
        }
        
        for color in colors {
            let colorView = UIView()
            colorView.backgroundColor = color
            colorView.layer.cornerRadius = 10 // Adjust the corner radius as needed
            colorStackView.addArrangedSubview(colorView)
        }
    }
    //sortDataAsPerPrice
    func sortDataAsPerPrice() {
        let data = categoryOptions[selectedIndex]
        if data.layout == "waterfall" {
            let sortedProducts = waterFallProducts.sorted{ $0.price > $1.price}
            waterFallProducts.removeAll()
            waterFallProducts = sortedProducts
            self.waterFallCollectionView.reloadData()
        } else {
            let sortedProducts = linearProducts.sorted{ $0.price > $1.price}
            linearProducts.removeAll()
            linearProducts = sortedProducts
            self.linearList.reloadData()
        }
    }
    
    func getDataAsPerRating() {
        self.toShowInitialList()
    }
}
