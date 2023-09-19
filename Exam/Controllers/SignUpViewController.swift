//
//  SignUpViewController.swift
//  Exam
//
//  Created by Phalkun Panha on 13/9/23.
//

import UIKit
import Photos

class SignUpViewController: UIViewController {

    private var signUpView: SignUpView!
    
    override func loadView() {
        super.loadView()
        
        signUpView = SignUpView()
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(signUpView)
        
        signUpView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        signUpView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        signUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        signUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-close"), style: .done, target: self, action: #selector(close))
        title = "Sign Up"
        
        signUpView.delegate = self
    }

    @objc private func close() {
        dismiss(animated: true)
    }
    
    private func openPhotoAlbume(){
        switch PHPhotoLibrary.authorizationStatus() {
            case .restricted, .denied, .notDetermined:
                let isRequested = false//Variable.shared.isReqestedPhotos
                if isRequested {
                    let alert = UIAlertController(title: "Photos permission", message: nil, preferredStyle: .alert)

                    let noButton = UIAlertAction(title: "No", style: .cancel)
                    let yesButton = UIAlertAction(title: "Yes", style: .default) { _ in
                        if let url = URL(string:UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(url)
                        }
                    }
                    alert.addAction(noButton)
                    alert.addAction(yesButton)

                    present(alert, animated: true)

                }else  {
                    PHPhotoLibrary.requestAuthorization() { status in
                        if status == .authorized {
//                            Variable.shared.isReqestedPhotos = true
                            DispatchQueue.main.async {
                                self.showPickPhotos()
                            }
                        }
                    }
                }

                return
            default:
                showPickPhotos()
        }
    }
    
    private func showPickPhotos() {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true)
    }
    
    
    
    private func openCamera(){
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .denied, .notDetermined:
                
                AVCaptureDevice.requestAccess(for: .video) { allowed in
                    if allowed {
                        DispatchQueue.main.async {
                            self.showCamera()
                        }
                    }
                }
                break
            default:
                showCamera()
        }
    }
    
    private func showCamera() {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera

        present(imagePicker, animated: true)
    }
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        signUpView.setImage(image)
    }
}

extension SignUpViewController: SignUpViewDelegate {
    func pickLabel() {
        
    }
    
    func submit() {
        print("Hii")
        
    }
    
    func pickImage(rect: CGRect) {
        print("Pick")
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "camera", style: .default) { _ in
            self.openCamera()
        }
        
        let photo = UIAlertAction(title: "Photo", style: .default) { _ in
            self.openPhotoAlbume()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionSheet.addAction(camera)
        actionSheet.addAction(photo)
        actionSheet.addAction(cancel)
        
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        
        if isiPad {
            actionSheet.popoverPresentationController?.sourceView = view
            
            let readRect = CGRect(x: rect.minX, y: rect.minY + view.safeAreaInsets.top, width: rect.width, height: rect.height)
            actionSheet.popoverPresentationController?.sourceRect = rect
        }
        
        present(actionSheet, animated: true)
        
    }
}
