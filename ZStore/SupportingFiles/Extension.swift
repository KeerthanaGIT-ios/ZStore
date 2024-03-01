//
//  Extension.swift
//  ZStore
//
//  Created by APPLE on 27/11/23.
//
import UIKit

//MARK:- safeArea
extension UIView {
    //MARK: safeTopAnchor
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }
    
    //MARK: safeLeftAnchor
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.leftAnchor
        }else {
            return self.leftAnchor
        }
    }
    
    //MARK: safeRightAnchor
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.rightAnchor
        }else {
            return self.rightAnchor
        }
    }
    
    //MARK: safeBottomAnchor
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }
}

extension UIFont {
    class func sfProBold(_ size:CGFloat)-> UIFont{
        return UIFont(name: "SF-Pro-Display-Medium.ttf", size: size)!
    }
    class func sfProMedium(_ size:CGFloat)-> UIFont{
        return UIFont(name: "SF-Pro-Display-Medium", size: size)!
    }
}
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
extension UIColor {
    class func getCellBgHighLiteColor()->UIColor {
        return UIColor(red: 254.0/255.0, green: 242.0/255.0, blue: 235.0/255.0, alpha: 1)
    }
    class func getCellBorderHighLiteColor()->UIColor {
        return UIColor(red: 230.0/255.0, green: 86.0/255.0, blue: 15.0/255.0, alpha: 1)
    }
    class func separatorColor()->UIColor {
        return UIColor(red: 216.0/255.0, green: 216.0/255.0, blue: 216.0/255.0, alpha: 1)
    }
    class func ratingsColor()->UIColor {
        return UIColor(red: 152.0/255.0, green: 152.0/255.0, blue: 152.0/255.0, alpha: 1)
    }
    class func transparentBgColor()->UIColor {
        return UIColor(red: 8.0/255.0, green: 21.0/255.0, blue: 36.0/255.0, alpha: 0.6)
    }
    class func customTitleColor()->UIColor {
        return UIColor(red: 84.0/255.0, green: 84.0/255.0, blue: 84.0/255.0, alpha: 1)
    }
    class func headerColor()->UIColor {
        return UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1)
    }
    class func liteColor()->UIColor {
        return UIColor(red: 116.0/255.0, green: 116.0/255.0, blue: 116.0/255.0, alpha: 1)
    }
}

extension UIImageView {
    /// - Parameters:
    ///   - url: URL that to be downloaded
    ///   - mode: ImageView content mode
    func downloadedFrom(url: URL?, contentMode mode: UIView.ContentMode = .scaleAspectFit, completion: (() -> ())? = nil) {
        
        contentMode = mode
        if let unwrappedurl = url {
            URLSession.shared.dataTask(with: unwrappedurl) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                else { return }
                DispatchQueue.main.async() {
                    self.image = image
                    if completion != nil {
                        completion!()
                    }
                    
                }
            }.resume()
        } else {
            self.image = #imageLiteral(resourceName: "ProfileImage")
        }
        
    }
}
import UIKit

class StarRatingView: UIView {
    var rating: Double = 0 {
        didSet {
            setNeedsLayout()
        }
    }

    let starSize: CGFloat = 15.0
    let spacing: CGFloat = 4.0
    let maxRating: Double = 5.0

    override func layoutSubviews() {
        super.layoutSubviews()

        // Remove existing subviews
        subviews.forEach { $0.removeFromSuperview() }

        // Calculate the number of full and half stars
        let fullStars = Int(rating)
        let hasHalfStar = rating.truncatingRemainder(dividingBy: 1) != 0

        // Create full star views
        for _ in 0..<fullStars {
            let fullStarView = createStarView(isHalf: false)
            addSubview(fullStarView)
        }

        // Create half star view if needed
        if hasHalfStar {
            let halfStarView = createStarView(isHalf: true)
            addSubview(halfStarView)
        }

        // Create empty star views to fill the remaining space
        let remainingStars = Int(maxRating - rating)
        for _ in 0..<remainingStars {
            let emptyStarView = createStarView(isHalf: false)
            emptyStarView.tintColor = UIColor.gray
            addSubview(emptyStarView)
        }

        // Calculate total width
        let totalWidth = CGFloat(fullStars) * (starSize + spacing) + (hasHalfStar ? (starSize + spacing) : 0)

        // Center the star views
        var xOffset = (bounds.width - totalWidth) / 2.0
        for starView in subviews {
            starView.frame.origin.x = xOffset
            xOffset += starSize + spacing
        }
    }

    private func createStarView(isHalf: Bool) -> UIImageView {
        let starView = UIImageView(image: isHalf ? UIImage(systemName: "star.leadinghalf.fill") : UIImage(systemName: "star.fill"))
        starView.contentMode = .scaleAspectFit
        starView.tintColor = UIColor.getCellBorderHighLiteColor()
        return starView
    }
}
