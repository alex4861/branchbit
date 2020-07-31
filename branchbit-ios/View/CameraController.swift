//
//  CameraController.swift
//  branchbit-ios
//
//  Created by Hugo on 31/07/20.
//  Copyright © 2020 Elektra. All rights reserved.
//

import UIKit
import AVFoundation
class CameraController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var input: AVCaptureDeviceInput!
    var captureDevice: AVCaptureDevice!
    fileprivate var captureSession: AVCaptureSession!
    internal var videoPreviewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .back)
        startReading()
        buttonVIew.layer.cornerRadius = buttonVIew.bounds.height/2
        // Do any additional setup after loading the view.
    }
    func startReading() {
        do {
            guard captureDevice != nil else {
                 throw NSError(domain: "Camera error", code: 0)
             }
            input = try AVCaptureDeviceInput(device: captureDevice!)
            captureSession = AVCaptureSession()
            captureSession.addInput(input)
            
        } catch {
            captureSession = nil
            return
        }
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession.addOutput(captureMetadataOutput)
        let dispatchQueue = DispatchQueue(label: "qrScannerQueue", attributes: [])
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue:dispatchQueue)
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer.frame.size = view.frame.size
        view.layer.insertSublayer(videoPreviewLayer, at: 0)
        captureSession.startRunning()
    }
    @IBOutlet weak var buttonVIew: UIView!
    
    @IBAction func takePic(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
