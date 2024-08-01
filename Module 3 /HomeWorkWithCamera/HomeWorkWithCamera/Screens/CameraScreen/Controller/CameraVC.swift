//
//  ViewController.swift
//  HomeWorkWithCamera
//
//  Created by Игорь Крысин on 09.07.2024.
//

import UIKit
import AVFoundation

class MainVC: UIViewController {
    
    var session: AVCaptureSession = AVCaptureSession()
    var preview: AVCaptureVideoPreviewLayer!
    var output = AVCapturePhotoOutput()
    
    lazy private var shootBtn: UIButton = {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 30
        $0.backgroundColor = .red
       return $0
    }(UIButton(frame: CGRect(x: view.center.x - 30, y: view.frame.height - 90, width: 60, height: 60), primaryAction: UIAction(handler: { _ in
        
        let settings = AVCapturePhotoSettings()
        settings.photoQualityPrioritization = .balanced
        settings.flashMode = .auto
        self.output.capturePhoto(with: settings, delegate: self)
    })))
    
    lazy var photoPreview: UIImageView = {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .lightGray
        return $0
    }(UIImageView(frame: CGRect(x: view.frame.width - 140, y: view.frame.height - 180, width: 80 , height: 80)))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Take a photo"
      
        createCamera()
        [shootBtn, photoPreview].forEach {
            view.addSubview($0)
        }
        // Do any additional setup after loading the view.
    }
    
    func createCamera() {
        session.sessionPreset =  .hd1920x1080
        
        guard let device  = AVCaptureDevice.default(.builtInWideAngleCamera , for: .video, position: .back) else {
            print("нет камеры")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            if session.canAddInput(input), session.canAddOutput(output) {
                session.addInput(input)
                session.addOutput(output)
            }
            
            preview = AVCaptureVideoPreviewLayer(session: session)
            preview.videoGravity = .resizeAspect
            
            DispatchQueue.global(qos: .userInteractive).async {
                self.session.startRunning()
            }
            
            preview.frame = view.bounds
            view.layer.addSublayer(preview)
        }catch {
            print(error.localizedDescription)
        }
    }


}

extension MainVC: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: (any Error)?) {
        guard let data = photo.fileDataRepresentation() else {
            return
        }
        
        if let image = UIImage(data: data) {
            self.photoPreview.image = image
            
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
}

