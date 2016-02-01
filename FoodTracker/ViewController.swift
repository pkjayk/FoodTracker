//
//  ViewController.swift
//  FoodTracker
//
//  Created by Jayson Kadlecek on 1/30/16.
//  Copyright © 2016 Kadalyst Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var defaultLabel: UIButton!
    @IBOutlet weak var photoImageView: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
//        // Allow view scroll/bounce
//        let scrollView = UIScrollView(frame: view.frame)
//        scrollView.delegate = self
//        scrollView.alwaysBounceVertical = true
//        scrollView.flashScrollIndicators()
//        view.addSubview(scrollView)
//        
//        
//        scrollView.addSubview(nameTextField)
//        scrollView.addSubview(mealNameLabel)
//        scrollView.addSubview(default)



        
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
        photoImageView!.image = selectedImage

        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)

    }


    
    //MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()

        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)

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

