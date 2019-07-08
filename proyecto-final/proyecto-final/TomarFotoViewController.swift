//
//  ViewController.swift
//  proyecto-final
//
//  Created by David Arroyo Sanchez on 6/14/19.
//  Copyright © 2019 David Arroyo Sanchez. All rights reserved.
//

import UIKit
import AVFoundation

class TomarFotoViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    let captureSession = AVCaptureSession()
    var previewLayer:CALayer!
    
    var captureDevice:AVCaptureDevice!
    
    var takePhoto = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareCamera()
    }
    
    func prepareCamera(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
        
        let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back).devices
            
        
           
        captureDevice = availableDevices.first
        beginSession()
            
    }
    
    func beginSession(){
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
            
            captureSession.addInput(captureDeviceInput)
            
        }catch{
            print(error.localizedDescription)
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        
        previewLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
        previewLayer.cornerRadius = 10;
        previewLayer.backgroundColor = UIColor.black.cgColor
        
        previewLayer.borderWidth = 80;
        
        previewLayer.borderColor = UIColor.black.withAlphaComponent(0.80).cgColor
        
      
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        self.previewLayer = previewLayer
        self.view.layer.addSublayer(self.previewLayer)
        self.previewLayer.frame = self.view.layer.frame
        
       
        
        
        captureSession.startRunning()
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as NSString):NSNumber(value: kCVPixelFormatType_32BGRA)] as [String : Any]
        
        dataOutput.alwaysDiscardsLateVideoFrames = true
        
        if captureSession.canAddOutput(dataOutput){
            captureSession.addOutput(dataOutput)
        }
        
        captureSession.commitConfiguration()
        
        let queue = DispatchQueue(label: "com.desarroyo.proyecto-final")
        dataOutput.setSampleBufferDelegate(self, queue: queue)
        
    }

    @IBAction func takePhoto(_ sender: Any) {
       takePhoto = true
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        if takePhoto{
            takePhoto = false
            
            let image = self.getImageFromSampleBuffer(buffer: sampleBuffer)
                
            let photoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotoVC") as! PhotoViewController
            
            photoVC.takenPhoto = image
            
            DispatchQueue.main.async {
                
                
                self.present(photoVC, animated: true, completion: {
                    self.stopCaptureSession()
                })
                
                
            }
            
        }
    }
    
    func getImageFromSampleBuffer(buffer:CMSampleBuffer) -> UIImage?{
        if let pixelBuffer = CMSampleBufferGetImageBuffer(buffer){
            let ciImage = CIImage(cvImageBuffer: pixelBuffer)
            let context = CIContext()
            
            let imageRect = CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(pixelBuffer), height: CVPixelBufferGetHeight(pixelBuffer))
            
            if let image = context.createCGImage(ciImage, from: imageRect){
                return UIImage(cgImage: image, scale: UIScreen.main.scale, orientation: .right)
            }
        }
        return nil
    }
    
    func stopCaptureSession () {
        self.captureSession.stopRunning()
        
        if let inputs = captureSession.inputs as? [AVCaptureDeviceInput] {
            for input in inputs {
                self.captureSession.removeInput(input)
            }
        }
    }
    
}

