//
//  ViewController.swift
//  proyecto-final
//
//  Created by David Arroyo Sanchez on 6/14/19.
//  Copyright © 2019 David Arroyo Sanchez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

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
        
        /*
        let cuadroBack = CAShapeLayer()
        cuadroBack.path =  UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight), cornerRadius: 10).cgPath
        
        cuadroBack.position = CGPoint(x: 0, y: 0)
        cuadroBack.fillColor = UIColor.blue.withAlphaComponent(0.70).cgColor
        
        let pathMutable = CGMutablePath()
        pathMutable.addPath(cuadroBack)
        //view.layer.insertSublayer(cuadroBack, above: self.view.layer)
        
        
        let cuadroFront = CAShapeLayer()
        cuadroFront.path =  UIBezierPath(roundedRect: CGRect(x: 50, y: 100, width: (screenWidth - 100), height: (screenHeight - 400)), cornerRadius: 10).cgPath
        
        cuadroFront.position = CGPoint(x: 0, y: 0)
        cuadroFront.fillColor = UIColor.green.withAlphaComponent(0.50).cgColor
        
        pathMutable.addPath(cuadroFront)
        
        cuadroBack.fillRule = CAShapeLayerFillRule.evenOdd
        
        view.layer.insertSublayer(cuadroFront, above: self.view.layer)
        */
        
        let width: CGFloat = 640
        let height: CGFloat = 640
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = CGRect(x: -100, y: 0,
                                  width: width, height: height)
        
        let path = CGMutablePath()
        
        stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 6).forEach {
            angle in
            var transform  = CGAffineTransform(rotationAngle: angle)
                .concatenating(CGAffineTransform(translationX: width / 2, y: height / 2))
            
            let petal = CGPath(ellipseIn: CGRect(x: -20, y: 0, width: 40, height: 100),
                               transform: &transform)
            
            path.addPath(petal)
        }
        
        shapeLayer.path = path
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.yellow.cgColor
        shapeLayer.fillRule = CAShapeLayerFillRule.evenOdd
        
        view.layer.insertSublayer(shapeLayer, above: self.view.layer)
        
        
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

