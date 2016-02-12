//
//  ViewController.swift
//  FoodTracker
//
//  Created by Jayson Kadlecek on 1/30/16.
//  Copyright © 2016 Kadalyst Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    
    //MARK: properties
    var nameTextField = UITextField()
    var mealNameLabel = UILabel()
    var defaultLabel = UIButton()
    var photoImageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var blueColor = UIColor(red: 39.0 / 255.0, green: 169.0 / 255.0, blue: 225.0 / 255.0, alpha: 1.0)
        
        self.view.backgroundColor = blueColor
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
//        // Allow view scroll/bounce
        let scrollView = UIScrollView(frame: view.frame)
        scrollView.delegate = self
        scrollView.alwaysBounceVertical = true
        scrollView.flashScrollIndicators()
        view.addSubview(scrollView)
        
        let labelWidth = UIScreen.mainScreen().bounds.width * 15 / 20
        let labelAndButtonWidth = UIScreen.mainScreen().bounds.width * 7 / 20
        
        let labelHeight = UIScreen.mainScreen().bounds.height / 25
        let buttonHeight = UIScreen.mainScreen().bounds.height * 1 / 15
        let labelAndButtonXOrigin = (UIScreen.mainScreen().bounds.width / 2) - (labelAndButtonWidth / 2)
        let labelXOrigin = (UIScreen.mainScreen().bounds.width / 2) - (labelWidth / 2)

        let labelAndButtonSpacing = UIScreen.mainScreen().bounds.height / 14
        
        
        // Add select an option label
        let selectAnOptionLabel = mealNameLabel
        scrollView.addSubview(selectAnOptionLabel)
        selectAnOptionLabel.frame.size.width = labelWidth
        selectAnOptionLabel.frame.size.height = labelHeight + (UIScreen.mainScreen().bounds.height / 30)
        selectAnOptionLabel.frame.origin.x = labelXOrigin
        selectAnOptionLabel.frame.origin.y = labelAndButtonSpacing
        selectAnOptionLabel.text = "Select a Meal."
        selectAnOptionLabel.textColor = UIColor.whiteColor()
        selectAnOptionLabel.textAlignment = NSTextAlignment.Center
        selectAnOptionLabel.font = UIFont.systemFontOfSize(CGFloat(integerLiteral: 34), weight: UIFontWeightThin)
        
        
        let routinesButton = UIButton(type: UIButtonType.Custom)
        scrollView.addSubview(routinesButton)
        routinesButton.frame.size.width = labelAndButtonWidth
        routinesButton.frame.size.height = buttonHeight
        routinesButton.frame.origin.x = labelAndButtonXOrigin
        routinesButton.frame.origin.y = (labelAndButtonSpacing * 2) + labelHeight
        routinesButton.setTitle("Add Image", forState: UIControlState.Normal)
        routinesButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        routinesButton.titleLabel?.font = UIFont.systemFontOfSize(CGFloat(integerLiteral: 24), weight: UIFontWeightThin)
        routinesButton.titleEdgeInsets = UIEdgeInsetsMake(0, labelAndButtonWidth / 20, 0, labelAndButtonWidth / 20)
        routinesButton.layer.borderColor = (UIColor.whiteColor()).CGColor
        routinesButton.layer.borderWidth = 1.0


        let tapMealImageButton = UITapGestureRecognizer(target: self, action: Selector("selectImageFromPhotoLibrary:"))
        tapMealImageButton.delegate = self
        routinesButton.addGestureRecognizer(tapMealImageButton)

        
        let newButton = UIButton(type: UIButtonType.Custom)
        scrollView.addSubview(newButton)
        newButton.frame.size.width = labelAndButtonWidth
        newButton.frame.size.height = buttonHeight
        newButton.frame.origin.x = labelAndButtonXOrigin
        newButton.frame.origin.y = (labelAndButtonSpacing * 2) + labelHeight + (buttonHeight * 1.5)
        newButton.setTitle("Next View", forState: UIControlState.Normal)
        newButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        newButton.titleLabel?.font = UIFont.systemFontOfSize(CGFloat(integerLiteral: 24), weight: UIFontWeightThin)
        newButton.layer.borderWidth = 0
        newButton.addTarget(self, action: "showCoolViewController", forControlEvents: UIControlEvents.TouchUpInside)


        let nextScreenLink = UILabel()
//        scrollView.addSubview(nextScreenLink)
        
        nextScreenLink.frame.size.width = labelWidth
        nextScreenLink.frame.size.height = buttonHeight
        nextScreenLink.frame.origin.x = labelXOrigin
        nextScreenLink.frame.origin.y = (labelAndButtonSpacing * 2) + labelHeight + (buttonHeight * 1.5)
        nextScreenLink.text = "To Next View"
        nextScreenLink.textAlignment = NSTextAlignment.Center
        nextScreenLink.textColor = UIColor.whiteColor()
        routinesButton.addTarget(self, action: "showCoolViewController", forControlEvents: UIControlEvents.TouchUpInside)
        

        
        
        
    }

    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // Hide the keyboard.
        textField.resignFirstResponder()
        
        return true;
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        mealNameLabel.text = textField.text
        
    }

    // MARK: UIImagePickerControllerDelegate

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage

        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)

    }


    
    //MARK: Actions
    
    func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)

    }
    
    func showCoolViewController() {
        
        let myCoolViewController = CoolViewController()
        self.showViewController(myCoolViewController, sender: self)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)

        
    }


    

    

    
    @IBAction func setDefaultLabelText(sender: UIButton) {
        
        if(mealNameLabel.text == "Meal Name"){
        
            mealNameLabel.text = "Default Text"
        
        }
        else {
            
            mealNameLabel.text = "Meal Name"
            
        }
        
    }
    
    

}

