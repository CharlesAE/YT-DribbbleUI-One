//
//  ViewController.swift
//  YT-DribbbleUI-One
//
//  Created by Charles Edwards on 9/26/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bgGray")
        configViews()
        configConstraints()
        // Do any additional setup after loading the view.
    }
    //Create the views
    
    // UIImageView was assigned an image file named "charles"
    //from the assets folder, and given a corner radius of 16
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  UIImage(named: "charles")
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    //The greeting label
    let greetingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .callout)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //The UIButton has an SF Symbol image attached,
    //a tint of black, background color of white, and rounded corners
    let notificationButton: UIButton = {
        var button = UIButton()
        let image = UIImage(systemName: "bell.badge")
        button.setImage(image, for: .normal)
        button.backgroundColor = .white
        button.tintColor = .black
        button.adjustsImageWhenHighlighted = false
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    // Title label is assigned a value of 2 for its 'numberOfLines' property
    // and 'lineBreakMode' is set to '.byWordWrapping'
    // This allows it to span multiple lines
    // I then set the size to Apple's 'largeTile' fontsize,
    // which you can already guess what this does
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.text = "Discover your favorite products?"
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
     }()
    
    // An empty uiview with a corner radius of 25,
    // I'll revisit this shortly
    let searchView: UIView = {
        let searchView = UIView()
        searchView.backgroundColor = .white
        searchView.layer.cornerRadius = 25
        searchView.translatesAutoresizingMaskIntoConstraints = false
        return searchView
        }()

    //UIButton, with an SF symbol and background color,
    // similar to the notification button earlier
     let searchIcon : UIButton = {
        var button = UIButton()
        let image = UIImage(systemName: "magnifyingglass")
        button.setImage(image, for: .normal)
        button.backgroundColor = .black
        button.tintColor = .white
        button.adjustsImageWhenHighlighted = false
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
      }()

    // Textfield to input text
     let searchTextField: UITextField = {
        var textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Search your product", attributes: [.font: UIFont.preferredFont(forTextStyle: .callout),.foregroundColor: UIColor.systemGray4])
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
      }()
    
    
    //The first instance of the CategoryView,
    //The text value of the UILabel within it is set to "New",
    //While the text color of the UILabel is set to "black"
    //And fnally the view's background color is set to "white"
    var newCategory: CategoryView = {
        let category = CategoryView()
        category.categoryLbl.text = "New"
        category.categoryLbl.textColor = .black
        category.backgroundColor = .white
        category.translatesAutoresizingMaskIntoConstraints = false
        return category
    }()

    //This CategoryView is set to "Featured"
    //And is basically a reverse of the previous
    var featuredCategory: CategoryView = {
        let category = CategoryView()
        category.categoryLbl.text = "Featured"
        category.categoryLbl.textColor = .white
        category.backgroundColor = .black
        category.translatesAutoresizingMaskIntoConstraints = false
        return category
    }()

    //The final Category view is essentially a copy of the first
    //Scroll up and take another look at the 'pills' image for a quick refresher
    var trendyCategory: CategoryView = {
        let category = CategoryView()
        category.categoryLbl.text = "Trendy"
        category.categoryLbl.textColor = .black
        category.backgroundColor = .white
        category.translatesAutoresizingMaskIntoConstraints = false
        return category
    }()

    //The stackview has it's spacing and distribution properties set
    let categoryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    func configViews(){
        view.addSubview(profileImage)
        view.addSubview(greetingLabel)
        view.addSubview(notificationButton)
        // Add the title label and search view to parent view
        view.addSubview(titleLabel)
        view.addSubview(searchView)

        // the icon and textfield are ADDED TO the searchview
        // the previously empty UIView
        searchView.addSubview(searchIcon)
        searchView.addSubview(searchTextField)
        
        
        //First, the stackview is added
        view.addSubview(categoryStackView)
        categoryStackView.addArrangedSubview(newCategory)
        categoryStackView.addArrangedSubview(featuredCategory)
        categoryStackView.addArrangedSubview(trendyCategory)
        
        
        greetingLabel.attributedText = configAttributedTitle("Hi, Charles", "!")
    }

    func configConstraints() {
        NSLayoutConstraint.activate([
        profileImage.topAnchor.constraint(
            equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
        // the following line

        // constraintconstraint(
        // equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor,
        // multiplier: 1)

        // essentially says that the top of the image
        // is set to the top of the parent view
        // within the safe area (below the iPhone's notch/dynamic island),
        // by a multiplier of 1, (which is equivalent to 8 pts)

        profileImage.leadingAnchor.constraint(
            equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
         
        // leadingAnchor.constraint(
        // equalToSystemSpacingAfter: leadingAnchor, multiplier: 3)

        // essentially says, the left of the image
        // is set to the side of the parent view,
        // by 24 pts (multiplier of 3. 3 * 8 = 24)

        profileImage.heightAnchor.constraint(equalToConstant: 32),
        profileImage.widthAnchor.constraint(equalToConstant: 32),
        // this sets the height and width to 32
        // which along with the corner radius previously set to 16
        // gives the image that full circular shape

        greetingLabel.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
        greetingLabel.leadingAnchor.constraint(
        equalToSystemSpacingAfter: profileImage.trailingAnchor, multiplier: 1),

        // The greeting label's Y anchor is equal to the Y anchor of profile image,
        // aligning them horizontally
        // the greeting label's left side
        // is set to 8pts awy from the profile image's right side

        notificationButton.heightAnchor.constraint(equalToConstant: 32),
        notificationButton.widthAnchor.constraint(equalToConstant: 32),
        notificationButton.centerYAnchor.constraint(equalTo: greetingLabel.centerYAnchor),
        view.trailingAnchor.constraint(
        equalToSystemSpacingAfter: notificationButton.trailingAnchor, multiplier: 3),

        // this essentially means that the right side of the parent view
        // is set to 24 (3 * 8) pts from the notification button's right side
        
        
        // The large title is anchored 32 pts below the first set of items,
        // 24 pts from the left of the parent view,
        // 32 pts from the right of the parentview
        titleLabel.topAnchor.constraint(
        equalToSystemSpacingBelow: greetingLabel.bottomAnchor, multiplier: 4),
        titleLabel.leadingAnchor.constraint(
            equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
        view.trailingAnchor.constraint(
        equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 4),

        // SearchView is set to 24 pts below the large title
        // and 32 pts from the left of the parent view
        searchView.topAnchor.constraint(
        equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
        searchView.leadingAnchor.constraint(
            equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),

        //Height anchor set to 50
        //Remember the corner radius was set to 25?
        //this will give it the circular look
        searchView.heightAnchor.constraint(equalToConstant: 50),
        view.trailingAnchor.constraint(
        equalToSystemSpacingAfter: searchView.trailingAnchor, multiplier: 4),

        //Remember the search icon is placed WITHIN the searchview
        //its Y anchor is then set to the searchview's own, centering it horizontally
        searchIcon.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
        searchIcon.heightAnchor.constraint(equalToConstant: 32),
        searchIcon.widthAnchor.constraint(equalToConstant: 32),

        //since it is to the RIGHTmost side of the searchview...
        //set the SEARCHVIEW's trailing anchor to be 16 pts from the icon's trailing
        //looking at that piece of code may confuse you, so think of it as...
        //the right of the search icon is set to 16 pts FROM the right of the search view
        searchView.trailingAnchor.constraint(
        equalToSystemSpacingAfter: searchIcon.trailingAnchor, multiplier: 2),

        //Again, the textfield is WITHIN the searchview
        //so it's Y anchor is set to the searchviews, centering it horizontally
        searchTextField.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
        searchTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: searchView.leadingAnchor, multiplier: 3),
        
        categoryStackView.topAnchor.constraint(equalToSystemSpacingBelow: searchView.bottomAnchor, multiplier: 3),
        categoryStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
        categoryStackView.heightAnchor.constraint(equalToConstant: 32),
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: categoryStackView.trailingAnchor, multiplier: 4),
                    
        //the CategoryViews are given a height of 32,
        //in order for those rounded corners which were set to 16
        //to have that circular shape
        newCategory.heightAnchor.constraint(equalToConstant: 32),
        featuredCategory.heightAnchor.constraint(equalToConstant: 32),
        trendyCategory.heightAnchor.constraint(equalToConstant: 32),
        ])
    }
    
    
    // This function requires two strings
    // the first being the greeting
    // the second being the exclamation mark
    // it will then set the color of the exclamation mark to orange
    func configAttributedTitle(_ greeting: String,_ coloredGreeting: String) -> NSAttributedString {
            let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: greeting, attributes: [.font: UIFont.preferredFont(forTextStyle: .callout),.foregroundColor: UIColor.label]))
        attributedText.append(NSAttributedString(string: coloredGreeting, attributes: [.font:UIFont.preferredFont(forTextStyle: .callout), .foregroundColor: UIColor(named: "orangeColor")!]))
            return attributedText
        }

}
