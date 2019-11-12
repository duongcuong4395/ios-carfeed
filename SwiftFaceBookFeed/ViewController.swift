//
//  ViewController.swift
//  SwiftFaceBookFeed
//
//  Created by Duong Cuong on 26/10/19.
//  Copyright © 2019 Duong Cuong. All rights reserved.
//
import Foundation
import UIKit
let cellID = "cellID"

//var imageCache = NSCache<AnyObject, AnyObject>()// [String: UIImage]()

class  Post {
    var name: String?
    var statusText: String?
    var profileImage: String?
    var statusImage: String?
    var location: String?
    var numbLikes: Int?
    var numbComments: Int?
    
    var statusImageUrl: String?
}

struct WebDescription : Decodable {
    let name: String?
    let description: String?
    let courses: [_Post]
}

struct _Post : Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
}

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let memoryCapacity = 50 * 1024 * 1024
        let diskCapacity = 50 * 1024 * 1024
        let urlCache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: "myDiskPath")
        URLCache.shared = urlCache
        
        //let jsonURLString = "https://api.letsbuildthatapp.com/jsondecodable/course"
        //let jsonURLString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        let jsonURLString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string: jsonURLString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //perhaps check err
            //also perhaps check response status 200 OK
            guard let data = data else { return }
            
            //let dataAsString = String(data: data, encoding: .utf8)
            //print(dataAsString)
            
            do {
                //Single jsonObject
                //let myPost = try JSONDecoder().decode(_Post.self, from: data)
                //print(myPost.name)
                
                //Json Array object
                //let listPost = try JSONDecoder().decode([_Post].self, from: data)
                //print(listPost)
                
                let webDes = try JSONDecoder().decode(WebDescription.self, from: data)
                print(webDes)
                
                //Switf 2/3/ObjC
                /*
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
                //print(json)
                let mypost = _Post(json: json)
                print(mypost.name)
                 */
                
            } catch let jsonErr {
                print("Error serializing json: ", jsonErr)
            }
            
            
        }.resume()
        
        //let myPost = _Post(id: 0, name: "", link: "", imageURL: "")
        //print(myPost)
        
        
        let postA = Post()
        postA.name = "Nguyen Van A"
        postA.profileImage = "BMW"
        postA.numbLikes = 403
        postA.numbComments = 2006
        postA.statusImage = "BMW Efficient Dynamic"
        postA.statusImageUrl = "https://www.bmw.in/content/dam/bmw/marketIN/bmw_in/Images/all-models/BMW%20Series/BMW%203%20series/sedan/2019/desktop.jpg"
        postA.statusText = "BMW car prices start(GST Included) at Rs 35.2 Lakh for the most inexpensive model in its lineup, the X1. The most expensive car in BMW's lineup is the M Series, priced at Rs. 1.54 Cr for its top variant. In total, BMW has 14 models on sale in India. The BMW X1, BMW Z4, BMW X7 are amongst the most popular cars in their respective segments. Upcoming BMW cars in India include the 8 Series,i3,X6 2020,2 Series."
        
        let postC = Post()
        postC.name = "Nguyen Van D"
        postC.profileImage = "Nissan"
        postC.numbLikes = 403
        postC.numbComments = 2006
        postC.statusImage = "Nissan Micra"
        postC.statusImageUrl = "https://reports.nissan-global.com/EN/wp-content/uploads/2019/10/Ariya-Concept.jpg"
        postC.statusText = "The new Nissan Ariya Concept, introduced today at the 46th Tokyo Motor Show, signals the dawn of a new era for Nissan as the company embarks to redefine its brand philosophy for the next evolutionary phase of the automobile. \n The Ariya Concept features a spacious, premium cabin with high-tech features and a body that conveys the pure, clean nature of electric cars. It embodies the Nissan Intelligent Mobility vision of personal transportation – one where electrification and vehicle intelligence will offer seamless and adaptive travel experiences free of accidents or harmful emissions. \n The Ariya Concept expands on design elements first hinted at by the Nissan IMx concept at the 2017 Tokyo Motor Show. They include the bold electrified V-motion signature “shield” and striking rear light blade, short overhangs, and an interior that feels more like a lounge than a conventional vehicle."
        
        let postD = Post()
        postD.name = "Nguyen Van E"
        postD.profileImage = "Porsche"
        postD.numbLikes = 403
        postD.numbComments = 2006
        postD.statusImage = "Porsche Carrera GT"
        postD.statusImageUrl = "https://cms-i.autodaily.vn/du-lieu/2018/09/24/porsche-taycan-exclusive-rendering.jpg"
        postD.statusText = "Porsche Annapolis in Annapolis, MD treats the needs of each individual customer with paramount concern. We know that you have high expectations, and as a car dealer we enjoy the challenge of meeting and exceeding those standards each and every time. Allow us to demonstrate our commitment to excellence! \n Our experienced sales staff is eager to share its knowledge and enthusiasm with you. We encourage you to browse our online inventory, schedule a test drive and investigate financing options. You can also request more information about a vehicle using our online form or by calling 866-982-9002."
        
        let postB = Post()
        postB.name = "Tran Van B"
        postB.profileImage = "Lamborghini"
        postB.numbLikes = 2006
        postB.numbComments = 403
        postB.statusImage = "Lamborghini Asterion"
        postB.statusImageUrl = "https://vnn-imgs-f.vgcloud.vn/2019/09/04/14/lamborghini-sian-1.jpg"
        postB.statusText = "Lamborghini’s electrification process started in 2017 with the presentation of the Terzo Millennio and proceeded with the launch of the Sián at the 2019 Frankfurt Motor Show. As part of this process, Automobili Lamborghini and the Massachusetts Institute of Technology have patented an innovative synthetic material that will act as the technological basis for a new generation of supercapacitors, an important initial result which will proceed with further optimization of the material’s properties and the creation of samples on increasingly larger scales. \n The collaboration began three years ago when Automobili Lamborghini joined the MIT-Italy Program, and took a further step forward in 2017 with collaboration with Professor Mircea Dincă (MIT - Department of Chemistry), and Professor John Hart  (MIT - Department of Mechanical Engineering). \n Stefano Domenicali, Chairman and Chief Executive Officer of Automobili Lamborghini, commented: “Joint research with MIT fully embodies our values and our vocation for anticipating the future: a future in which hybridization is increasingly desirable and inevitably necessary.”"
        
        posts.append(postA)
        posts.append(postB)
        posts.append(postC)
        posts.append(postD)
        
        // Do any additional setup after loading the view.
        navigationItem.title = "Hello Feed"
        
        collectionView.alwaysBounceVertical = true
        
        collectionView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellID)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let feedCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FeedCell
        feedCell.post = posts[indexPath.item]
        feedCell.feedController = self
        
        /*
        if let name = posts[indexPath.item].name {
            feedCell.nameLabel.text = name
        }
 */
        return feedCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let statusText = posts[indexPath.item].statusText {
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [kCTFontAttributeName as NSAttributedString.Key: UIFont.systemFont(ofSize: 14)], context: nil)
            //constrains Vertical
            let knownHeight: CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44
            return CGSize(width: view.frame.width, height: rect.height + knownHeight + 26)
        }
        return CGSize(width: view.frame.width, height: 500)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        collectionView.collectionViewLayout.invalidateLayout()
    }

    let zoomImageView = UIImageView()
    let blackBackGroundView = UIView()
    let navBarConverView = UIView()
    let tabBarConverView = UIView()
    
    var statusImageView: UIImageView?
    
    func animateImageView(statusImageView: UIImageView) {
        self.statusImageView = statusImageView
        if let startingFrame = statusImageView.superview?.convert(statusImageView.frame, to: nil) {
            
            statusImageView.alpha = 0
            
            blackBackGroundView.frame = self.view.frame
            blackBackGroundView.backgroundColor = UIColor.black
            blackBackGroundView.alpha = 0
            view.addSubview(blackBackGroundView)
            
            navBarConverView.frame = CGRect(x: 0.0, y: 0.0, width: 1000.0, height: 20 + 44)
            navBarConverView.backgroundColor = UIColor.black
            navBarConverView.alpha = 0
            //Returns the singleton app instance.
            //This property holds the UIWindow object in the windows array that is most recently sent the makeKeyAndVisible() message.
            if let keyWindow = UIApplication.shared.keyWindow{
                keyWindow.addSubview(navBarConverView)
                
                tabBarConverView.frame = CGRect(x: 0.0, y: keyWindow.frame.height - 50, width: 1000.0, height: 50)
                tabBarConverView.backgroundColor = UIColor.black
                tabBarConverView.alpha = 0
                keyWindow.addSubview(tabBarConverView)
            }
            
            //zoomImageView.backgroundColor = UIColor.red
            zoomImageView.frame = startingFrame
            zoomImageView.isUserInteractionEnabled = true
            zoomImageView.image = statusImageView.image
            zoomImageView.contentMode = .scaleAspectFill
            zoomImageView.clipsToBounds = true
            view.addSubview(zoomImageView)
            
            zoomImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoomOut)))
            
            UIView.animate(withDuration: 1.25, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {() -> Void in
                let heigh = (self.view.frame.width / startingFrame.width) * startingFrame.height
                let y = self.view.frame.height / 2 - heigh / 2
                
                self.zoomImageView.frame = CGRect(x: 0.0, y: y, width: self.view.frame.width, height: heigh)
                
                self.blackBackGroundView.alpha = 1
                self.navBarConverView.alpha = 1
                self.tabBarConverView.alpha = 1
            }, completion: nil)
            
            /*
            UIView.animate(withDuration: 0.75, animations: {() -> Void in
                let heigh = (self.view.frame.width / startingFrame.width) * startingFrame.height
                let y = self.view.frame.height / 2 - heigh / 2
                
                self.zoomImageView.frame = CGRect(x: 0.0, y: y, width: self.view.frame.width, height: heigh)
                
                self.blackBackGroundView.alpha = 1
                self.navBarConverView.alpha = 1
                self.tabBarConverView.alpha = 1
            })
            */
        }
    }
    
    @objc func zoomOut() {
        //do Something
        if let startingFrame = statusImageView!.superview?.convert(statusImageView!.frame, to: nil) {
            
        
            UIView.animate(withDuration: 0.75, animations: {() -> Void in
                self.zoomImageView.frame  = startingFrame
                self.blackBackGroundView.alpha = 0
                self.navBarConverView.alpha = 0
                self.tabBarConverView.alpha = 0
            }, completion: {(didComplete) -> Void in
                self.zoomImageView.removeFromSuperview()
                self.blackBackGroundView.removeFromSuperview()
                self.navBarConverView.removeFromSuperview()
                self.tabBarConverView.removeFromSuperview()
                self.statusImageView?.alpha = 1
            })
        }
    }
}

class FeedCell: UICollectionViewCell {
    
    var feedController: FeedController?
    
    @objc func animate()  {
        feedController?.animateImageView(statusImageView: statusImageView)
    }
    var post: Post? {
        didSet {
            
            statusImageView.image = nil
            /*
             if let statusImage = post?.statusImage {
                statusImageView.image = UIImage(named: statusImage)
             }
             
            if let statusImage = post?.statusImage {
                statusImageView.image = UIImage(named: statusImage)
                loader.stopAnimating()
            }
            */
            
            if let statusImageUrl = post?.statusImageUrl {
                //statusImageView.image = UIImage(named: statusImage)
                //if let image = imageCache.object(forKey: statusImageUrl as AnyObject) as? UIImage {
                //    statusImageView.image = image
                //} else {
                    URLSession.shared.dataTask(with: URL(string: statusImageUrl)!, completionHandler: {(data, response, error) -> Void in
                        if error != nil {
                            print(error ?? "Error")
                            return
                        }
                        
                        let image = UIImage(data: data!)
                        //imageCache.setObject(image!, forKey: statusImageUrl as AnyObject)
                        //imageCache[statusImageUrl] = image
                        DispatchQueue.main.async(execute: {() -> Void in
                            self.statusImageView.image = image
                        })
                        
                    }).resume()
                //}
            }
            
            if let name = post?.name {
                let attributeText = NSMutableAttributedString(string: name, attributes: [kCTFontAttributeName as NSAttributedString.Key: UIFont.boldSystemFont(ofSize: 14)])
                
                attributeText.append(NSAttributedString(string: "\nFull date + Address + ", attributes: [kCTFontAttributeName as NSAttributedString.Key: UIFont.systemFont(ofSize: 12), kCTForegroundColorAttributeName as NSAttributedString.Key: UIColor.rgb(red: 155, green: 160, blue: 170)]))
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 4
                attributeText.addAttribute(kCTParagraphStyleAttributeName as NSAttributedString.Key, value: paragraphStyle, range: NSMakeRange(0, attributeText.string.count))
                
                let attachment = NSTextAttachment()
                attachment.image = UIImage(named: "Lamborghini Lp 670")
                attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
                attributeText.append(NSAttributedString(attachment: attachment))
                
                nameLabel.attributedText = attributeText
            }
            
            if let statusText = post?.statusText {
                statusTextView.text = statusText
            }
            
            if let profileImage = post?.profileImage {
                profileImageView.image = UIImage(named: profileImage)
            }
            
            
        }
    }
    
    private func setupNameLocationStatusAndProfileimage() {
        //Code something
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //User Label
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    //Avartar Image
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Lamborghini Aventador")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //Status text
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.text = "New Status"
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = false
        return textView
    }()
    
    //Status Image
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Lamborghini Murclelago 640")
        imageView.contentMode = .scaleAspectFit
        //A Boolean indicating whether sublayers are clipped to the layer’s bounds. Animatable.
        imageView.layer.masksToBounds = true
        //A Boolean value that determines whether user events are ignored and removed from the event queue.
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let likesCommentsLabel: UILabel = {
        let  label = UILabel()
        label.text = "403 Likes     2006 Comments"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.rgb(red: 155, green: 161, blue: 171)
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 226, green: 228, blue: 232)
        return view
    }()
    
    let likeButton: UIButton = FeedCell.buttonForTitle(title: "Like", imageName: "iconLike")
    let commentButton: UIButton = FeedCell.buttonForTitle(title: "Comment", imageName: "iconLike")
    let shareButton: UIButton = FeedCell.buttonForTitle(title: "Share", imageName: "iconLike")
    
    
    static func buttonForTitle(title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 163), for: .normal)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }
    
    
    
    func setupView() {
        backgroundColor = UIColor.white
        
        //Adds a view to the end of the receiver’s list of subviews.
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likesCommentsLabel)
        addSubview(dividerLineView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
        statusImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animate)))
        
        /*
        //Set width equal 44 for profileImage
        //set constrain leading for profileImage equal 8
        //set trailing with nameLabel of profileImage equal 8
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0(44)]-8-[v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": profileImageView, "v1": nameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        //set height equal 44 for profileImage
        //set constrain top equal 8 for profileImage
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0(44)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": profileImageView]))
 */
        
        //Use Extension
        addConstainWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        addConstainWithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
        addConstainWithFormat(format: "H:|[v0]|", views: statusImageView)
        
        addConstainWithFormat(format: "H:|-12-[v0]|", views: likesCommentsLabel)
        addConstainWithFormat(format: "H:|-12-[v0]-12-|", views: dividerLineView)
        addConstainWithFormat(format: "H:|[v0(v2)][v1(v2)][v2]|", views: likeButton, commentButton, shareButton)
        
        addConstainWithFormat(format: "V:|-8-[v0]", views: nameLabel)
        addConstainWithFormat(format: "V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-8-[v3(25)]-8-[v4(0.4)][v5(44)]|", views: profileImageView, statusTextView, statusImageView, likesCommentsLabel, dividerLineView, likeButton)
        
        addConstainWithFormat(format: "V:[v0(44)]|", views: commentButton)
        addConstainWithFormat(format: "V:[v0(44)]|", views: shareButton)
    }
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstainWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

